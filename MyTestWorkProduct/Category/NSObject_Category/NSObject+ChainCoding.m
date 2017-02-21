//
//  NSObject+ChainCoding.m
//  MyTestWorkProduct
//
//  Created by xuyefeng on 16/7/6.
//  Copyright © 2016年 zhoufei. All rights reserved.
//
//  链式编程
//  计算器

#import "NSObject+ChainCoding.h"

@implementation NSObject (ChainCoding)

+ (int)zf_makeCalculat:(void(^)(CalculatorManager *))block
{
    CalculatorManager *manager =[[CalculatorManager alloc]init];
    block(manager);
    return manager.result;
}

@end
