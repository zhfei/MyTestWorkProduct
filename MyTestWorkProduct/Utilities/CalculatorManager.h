//
//  CalculatorManager.h
//  MyTestWorkProduct
//
//  Created by xuyefeng on 16/7/6.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorManager : NSObject

@property (assign,nonatomic)int  result;
//链式编程思想
- (CalculatorManager *(^)(int))add;

//函数式编程思想
- (instancetype)multiply:(int(^)(int))multiply;

@end
