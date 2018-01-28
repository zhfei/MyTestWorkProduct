//
//  Person.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/1/7.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>

#define PersonErrorDomain @"com.xkeshi.person"

@implementation Person

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"name"]) {
        MyLog(@"%@",change);
    }
}

-(BOOL)validateName:(id *)ioValue error:(NSError **)outError
{
    // The name must not be nil, and must be at least two characters long.
    if ((*ioValue == nil) || ([(NSString *)*ioValue length] < 2)) {
        if (outError != NULL) {
            NSString *errorString = NSLocalizedStringFromTable(
                                                               @"A Person's name must be at least two characters long", @"Person",
                                                               @"validation: too short name error");
            NSDictionary *userInfoDict =
            [NSDictionary dictionaryWithObject:errorString
                                        forKey:NSLocalizedDescriptionKey];

            *outError = [[NSError alloc] initWithDomain:PersonErrorDomain
                                                    code:-1
                                                userInfo:userInfoDict] ;
        }
        return NO;  
    }
    
  return YES;
}

// kvc时，找不到对应的属性时，会报错
- (id)valueForUndefinedKey:(NSString *)key
{
    
    MyLog(@"key有问题"); 
    return key;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        _ID =[value intValue];
    }
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"name" context:nil];
}

+ (instancetype)personWithDict:(NSDictionary *)dict
{
    Person *p =[[Person alloc]init];
    
    unsigned int count=0;
    
    Ivar *ivar= class_copyIvarList([self class], &count);
    
    for (int i=0; i<count; i++) {
        Ivar var =ivar[i];
        
        NSString *varName= [NSString stringWithUTF8String:ivar_getName(var)];
        NSString *varTypeEncode= [NSString stringWithUTF8String:ivar_getTypeEncoding(var)];
        
        varName=[varName substringFromIndex:1];
        
        id value =dict[varName];
        if (value) {
            [p setValue:value forKey:varName];
        }
        
    }
    return p;
}

@end
