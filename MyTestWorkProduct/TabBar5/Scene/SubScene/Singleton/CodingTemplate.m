//
//  CodingTemplate.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/2/27.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "CodingTemplate.h"
#import <objc/runtime.h>

@implementation CodingTemplate



#pragma mark --NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {

    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (int i = 0 ; i<count ;i++){
        //取出i位置对应的成员变量
        Ivar var = ivars[i];
        //查看成员变量
        const char *name = ivar_getName(var);
        //归档
        NSString *key = [NSString stringWithUTF8String:name];
        id value = [self valueForKey:key];
        [aCoder encodeObject:value forKey:key];
    }
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {

    if (self = [super init]) {
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([self class], &count);
        for (int i = 0 ; i<count ;i++){
            //取出i位置的对应的成员变量
            Ivar var = ivars[i];
            //查看成员变量
            const char *name = ivar_getName(var);
            //解档
            NSString *key = [NSString stringWithUTF8String:name];
            id value = [aDecoder decodeObjectForKey:key];
            //设置到成员变量身上
            [self setValue:value forKey:key];
        
        }
    }
    
    return self;
}


@end
