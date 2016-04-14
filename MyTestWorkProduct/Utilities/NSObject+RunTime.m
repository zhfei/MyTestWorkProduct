//
//  NSObject+RunTime.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/4/13.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "NSObject+RunTime.h"
#import <objc/runtime.h>

@implementation NSObject (RunTime)

/**
 *  获得对象所有的属性名
 *
 *  @return 返回对象所有的属性名的数组
 */
- (NSArray*)getObjectAllPropertyName
{
    unsigned int count ;
    
    NSMutableArray *arrayM =[NSMutableArray array];
    objc_property_t *propertys =class_copyPropertyList([self class], &count);
    for (int i=0; i<count; i++) {
        objc_property_t property=propertys[i];
        const char * name =property_getName(property);
        NSString * propertyName =[NSString stringWithUTF8String:name];
        
        [arrayM addObject:[propertyName mutableCopy]];
    }
    
    return arrayM;
}

/**
 *  获得对象所有的方法名
 *
 *  @return 获得对象所有的方法名的数组
 */
- (NSArray*)getObjectAllMethodName
{
    unsigned int count;
    
    NSMutableArray *arrayM =[NSMutableArray array];
    Method *methods =class_copyMethodList([self class], &count);
    for (int i=0; i<count; i++) {
        Method method =methods[i];
        SEL methodName =method_getName(method);
        const char *selName=sel_getName(methodName);
        NSString *nameString=[NSString stringWithUTF8String:selName];
        
        [arrayM addObject:[nameString mutableCopy]];
    }
    
    return arrayM;
}

/**
 *  获得对象所有遵守协议的名
 *
 *  @return 返回对象所有遵守协议的名的数组
 */
- (NSArray*)getObjectAllAgreeProtocolName
{
    unsigned int count;
    
    NSMutableArray *arrayM=[NSMutableArray array];
    __unsafe_unretained Protocol * *protocals= class_copyProtocolList([self class], &count);
    for (int i=0; i<count; i++) {
        Protocol *protocol =protocals[i];
        const char *name= protocol_getName(protocol);
        NSString *protocolName=[NSString stringWithUTF8String:name];
        
        [arrayM addObject:[protocolName mutableCopy]];
    }
    
    return arrayM;
}

@end
