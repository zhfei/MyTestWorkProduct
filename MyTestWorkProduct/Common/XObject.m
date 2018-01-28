//
//  XObject.m
//  XPay
//
//  Created by jack zhou on 2/02/15.
//  Copyright (c) 2015 jack zhou. All rights reserved.
//

#import "XObject.h"
#import "NSObject+AutoDescription.h"
#import <objc/runtime.h>
#import "NSString+HTML.h"

@implementation XObject

#pragma mark - Public Methods

- (id)initWithDictionary:(NSDictionary *)JSON error:(NSError * __autoreleasing *)error
{
    self = [super init];
    
    NSDictionary *JSONKeysToPropertyKeys = [self JSONKeysToPropertyKeys];
    
    if (![JSON isKindOfClass:[NSDictionary class]]) {
        if (error) {
            *error = [NSError errorWithDomain:@"Invalid JSON" code:-1 userInfo:nil];
        }
        return nil;
    }
    
    for (NSString *jsonKey in JSON) {
        NSString *propertyKey = JSONKeysToPropertyKeys[jsonKey] ? JSONKeysToPropertyKeys[jsonKey] : jsonKey;
        
        if ([self respondsToSelector:NSSelectorFromString(propertyKey)]) {
            Class class = NSClassFromString( [self getPropertyTypeString:propertyKey]);
            if ([class isSubclassOfClass:[XObject class]]) {
                // if JSON[jsonKey] is NSNull class, ignore it. so it becomes nil.
                if (![JSON[jsonKey] isKindOfClass:[NSNull class]]) {
                    // init it with the right class
                    XObject *value = [[class alloc] initWithDictionary:JSON[jsonKey] error:nil];
                    [self setValue:value forKey:propertyKey];
                }
            } else {
                if (![JSON[jsonKey] isKindOfClass:[NSNull class]]) {
                    objc_property_t property = class_getProperty([self class], [propertyKey UTF8String]);
                    char *propertyType = property_copyAttributeValue(property, "T");
                    id data =JSON[jsonKey];
                    switch (propertyType[0]) {
                        case 'i': // int
                            [self setValue:[NSNumber numberWithInt:[data intValue]] forKey:propertyKey];
                            break;
                        case 's': // short
                            [self setValue:[NSNumber numberWithShort:[data shortValue]] forKey:propertyKey];
                            break;
                        case 'l': // long
                            [self setValue:[NSNumber numberWithLong:[data longValue]] forKey:propertyKey];
                            break;
                        case 'q': // long long
                            [self setValue:[NSNumber numberWithLongLong:[data longLongValue]] forKey:propertyKey];
                            break;
                        case 'I': // unsigned int
                            [self setValue:[NSNumber numberWithUnsignedInt:[data unsignedIntValue]] forKey:propertyKey];
                            break;
                        case 'S': // unsigned short
                            [self setValue:[NSNumber numberWithUnsignedShort:[data unsignedShortValue]] forKey:propertyKey];
                            break;
                        case 'L': // unsigned long
                            [self setValue:[NSNumber numberWithUnsignedLong:[data unsignedLongValue]] forKey:propertyKey];
                            break;
                        case 'Q': // unsigned long long
                            [self setValue:[NSNumber numberWithUnsignedLongLong:[data unsignedLongLongValue]] forKey:propertyKey];
                            break;
                        case 'B': // BOOL
                        case 'c':
                            [self setValue:[NSNumber numberWithBool:[data boolValue]] forKey:propertyKey];
                            break;
                        case 'f': // float
                            [self setValue:[NSNumber numberWithFloat:[data floatValue]] forKey:propertyKey];
                        case 'd': // double
                            [self setValue:[NSNumber numberWithDouble:[data doubleValue]] forKey:propertyKey];
                            break;
                        default:
                            switch (propertyType[4]) {
                                case 'S': {
                                    if (![propertyKey isEqualToString:@"description"] ) {
                                        [self setValue:[NSString stringWithFormat:@"%@",JSON[jsonKey]] forKey:propertyKey];
                                    }
                                    break;
                                }
                                default:
                                    [self setValue:JSON[jsonKey] forKey:propertyKey];
                                    break;
                            }
                    }
                    // 释放
                    if (propertyType) {
                        free(propertyType);
                        propertyType = NULL;
                    }
                }
            }
        }
    }
    
    return self;
}

#pragma mark - Utils

- (NSString *)getPropertyTypeString:(NSString *)propertyName
{
    objc_property_t property = class_getProperty([self class], [propertyName UTF8String]);
    // propertyAttributes looks like: T@"NSArray",&,Vstuff
    const char * propertyAttributes = property_getAttributes(property);
    // suck out the type within attributes
    NSArray *sections = [[NSString stringWithUTF8String:propertyAttributes] componentsSeparatedByString:@"\""];
    
    NSString *type;
    // something like T@"ViewController",&,N,V_viewController
    if (sections.count == 3) {
        type = sections[1];
    }
    // if it is primitive value, it's like Ti,N,V_number
    return type;
}

- (NSDictionary *)JSONKeysToPropertyKeys
{
    return @{};
}

- (NSString *)description
{
    return [self autoDescription];
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    unsigned int propertyCount;
    objc_property_t *properties = class_copyPropertyList([self class], &propertyCount);
    
    for (int i = 0; i < propertyCount; i++) {
        objc_property_t property = properties[i];
        char *propertyType = property_copyAttributeValue(property, "T");
        NSString *propertyName = [NSString stringWithFormat:@"%s", property_getName(property)];
        char *iVar = property_copyAttributeValue(property, "V");
        NSString *iVarName = [NSString stringWithFormat:@"%s", iVar];
        free(iVar);
        
        if (!iVar) {
            free(propertyType);
            continue;
        }
        
        @try {
            switch (propertyType[0]) {
                case 'i': // int
                case 's': // short
                case 'l': // long
                case 'q': // long long
                case 'I': // unsigned int
                case 'S': // unsigned short
                case 'L': // unsigned long
                case 'Q': // unsigned long long
                    [aCoder encodeInteger:[[self valueForKey:iVarName] intValue] forKey:propertyName];
                    break;
                case 'B': // BOOL
                case 'c':
                    [aCoder encodeBool:[[self valueForKey:iVarName] boolValue] forKey:propertyName];
                    break;
                case 'f': // float
                    [aCoder encodeFloat:[[self valueForKey:iVarName] floatValue] forKey:propertyName];
                    break;
                case 'd': // double
                    [aCoder encodeDouble:[[self valueForKey:iVarName] doubleValue] forKey:propertyName];
                    break;
                default:
                    [aCoder encodeObject:[self valueForKey:iVarName] forKey:propertyName];
            }
        }
        @catch (NSException *exception) {
            NSLog(@"encodeException:%@", exception);
        }
        free (propertyType);
    }
    free(properties);
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        unsigned int propertyCount;
        objc_property_t *properties = class_copyPropertyList([self class], &propertyCount);
        
        for (int i = 0; i < propertyCount; i++) {
            objc_property_t property = properties[i];
            char *propertyType = property_copyAttributeValue(property, "T");
            NSString *propertyName = [NSString stringWithFormat:@"%s", property_getName(property)];
            char *iVar = property_copyAttributeValue(property, "V");
            NSString *iVarName = [NSString stringWithFormat:@"%s", iVar];
            
            if (!iVar) {
                free(propertyType);
                continue;
            }
            free(iVar);
            
            @try {
                switch (propertyType[0]) {
                    case 'i': // int
                    case 's': // short
                    case 'l': // long
                    case 'q': // long long
                    case 'I': // unsigned int
                    case 'S': // unsigned short
                    case 'L': // unsigned long
                    case 'Q': // unsigned long long
                        [self setValue:[NSNumber numberWithInteger:[aDecoder decodeIntegerForKey:propertyName]] forKey:iVarName];
                        break;
                    case 'B':
                    case 'c': {//此处为了解决 之前版本数据类型保存错误，在64位下 会有异常
                        BOOL boolValue;
                        @try {
                            boolValue = [aDecoder decodeBoolForKey:propertyName];
                        }
                        @catch (NSException *exception) {
                            boolValue = [[aDecoder decodeObjectForKey:propertyName] boolValue];
                        }
                        [self setValue:[NSNumber numberWithBool:boolValue] forKey:iVarName];
                    }
                        break;
                    case 'f': // float
                        [self setValue:[NSNumber numberWithFloat:[aDecoder decodeFloatForKey:propertyName]] forKey:iVarName];
                        break;
                    case 'd': // double
                        [self setValue:[NSNumber numberWithDouble:[aDecoder decodeDoubleForKey:propertyName]] forKey:iVarName];
                        break;
                    default:
                        if ([aDecoder containsValueForKey:propertyName]) {
                            [self setValue:[aDecoder decodeObjectForKey:propertyName] forKey:iVarName];
                        }
                }
            }
            @catch (NSException *exception) {
                NSLog(@"setValueException:%@", exception);
            }
            free(propertyType);
        }
        free(properties);
    }
    return self;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    id object = [[[self class] allocWithZone:zone] init];
    
    unsigned int propertyCount;
    objc_property_t *properties = class_copyPropertyList([self class], &propertyCount);
    
    for (int i = 0; i < propertyCount; i++) {
        objc_property_t property = properties[i];
        char * attributeValue = property_copyAttributeValue(property, "V");
        NSString *iVarName = [NSString stringWithFormat:@"%s", attributeValue];
        free(attributeValue);
        [object setValue:[self valueForKey:iVarName] forKey:iVarName];
    }
    free(properties);
    return object;
}

@end