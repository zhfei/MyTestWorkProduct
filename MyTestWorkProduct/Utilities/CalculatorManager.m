//
//  CalculatorManager.m
//  MyTestWorkProduct
//
//  Created by xuyefeng on 16/7/6.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "CalculatorManager.h"

@implementation CalculatorManager

- (CalculatorManager *(^)(int))add
{
    return ^(int number){
    
        _result+=number;
        
        return self;
    };
}

//函数式编程思想
- (instancetype)multiply:(int(^)(int))multiply
{
    _result=multiply(_result);
    
    return self;
}

@end
