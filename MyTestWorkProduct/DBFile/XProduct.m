//
//  XProduct.m
//  Coffee
//
//  Created by YrionPlus on 15/11/5.
//  Copyright © 2015年 XPay. All rights reserved.
//

#import "NSObject+AutoDescription.h"
#import <objc/runtime.h>

#import "XProduct.h"

@implementation XProduct


#pragma mark - Utils

- (NSString *)description
{
    return [self autoDescription];
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