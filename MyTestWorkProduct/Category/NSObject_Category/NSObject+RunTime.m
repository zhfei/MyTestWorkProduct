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
    
    free(propertys);
    
    return arrayM;
}


+ (NSArray<NSDictionary *> *)ys_propertiesAndTypeList {
    
     unsigned int count = 0;
     objc_property_t *list = class_copyPropertyList([self class], &count);

     NSMutableArray<NSDictionary *> *arrayM = [NSMutableArray<NSDictionary *> array];

     for (unsigned int i = 0; i < count; i++) {
    
             objc_property_t pty = list[i];
    
             const char *cType = property_getAttributes(pty);
             NSString *typeStr = [NSString stringWithUTF8String:cType];
    
             if([typeStr containsString:@"\",&"]){
                     NSRange typeRange = [typeStr rangeOfString:@"\",&"];
                     NSString *type = [typeStr substringWithRange:NSMakeRange(3, typeRange.location - 3)];
        
                     const char *cName = property_getName(pty);
                     NSString *name = [NSString stringWithUTF8String:cName];
        
                     NSDictionary *dict = @{name:type};
        
                     [arrayM addObject:dict];
                 }
         }

     free(list);

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




#pragma mark - 字典 -> 当前类的对象
+ (instancetype)ys_objectWithDictionary:(NSDictionary *)dictionary{

     // 当前类的属性数组
     NSArray *list = [self getObjectAllPropertyName];

     NSArray<NSDictionary *> *propertyTypeList = [self ys_propertiesAndTypeList];
    

     id obj = [self new];

     for (NSString *key in dictionary) {
    
             if([list containsObject:key]){
        
                     if ([dictionary[key] isKindOfClass:[NSDictionary class]]){ // 属性值为字典
            
                             for(NSDictionary *dict in propertyTypeList){
                
                                     if([key isEqualToString: [NSString stringWithFormat:@"%@",dict.allKeys.firstObject]]){
                    
                                             NSString *classTypeStr = dict[key];
                                             Class class = NSClassFromString(classTypeStr);
                    
                                             id objChild = [class ys_objectWithDictionary:dictionary[key]];
                    
                                             [obj setValue:objChild forKey:key];
                                         }
                                 }
                         
                         }
                     else if([dictionary[key] isKindOfClass:[NSArray<NSDictionary *> class]]){ // 属性值为字典数组
                         
                         }
                     else{
                             [obj setValue:dictionary[key] forKey:key];
                         }
                 }
         }
 
     return obj;
 }


@end
