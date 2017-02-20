//
//  SingletonTemplate.m
//  MyTestWorkProduct
//
//  Created by xuyefeng on 17/2/19.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "SingletonTemplate.h"

@implementation SingletonTemplate

+ (instancetype)sharedSingletonTemplate {
    
    static dispatch_once_t onceToken;
    static SingletonTemplate *st=nil;
    dispatch_once(&onceToken, ^{
        st=[[self alloc] init];
    });
    
    return st;
}

+(id) allocWithZone:(struct _NSZone *)zone {
    
    return [SingletonTemplate sharedSingletonTemplate];
    
}

-(id) copyWithZone:(struct _NSZone *)zone {
    
    return [SingletonTemplate sharedSingletonTemplate];
}



@end
