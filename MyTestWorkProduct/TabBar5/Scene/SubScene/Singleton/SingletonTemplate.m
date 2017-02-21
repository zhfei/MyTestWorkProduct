//
//  SingletonTemplate.m
//  MyTestWorkProduct
//
//  Created by xuyefeng on 17/2/19.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "SingletonTemplate.h"

static SingletonTemplate *_instance=nil;

@implementation SingletonTemplate

+ (instancetype)sharedSingletonTemplate {
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _instance=[[self alloc] init];
    });
    return _instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

- (id)copyWithZone:(NSZone *)zone
{
    return _instance;
}



@end
