//
//  BuickCar.m
//  MyTestWorkProduct
//
//  Created by xuyefeng on 17/5/11.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "BuickCar.h"

@implementation BuickCar

    // 让他做跟自我介绍
- (NSString *)description{
    
    return [NSString stringWithFormat:@"我是一辆:%@ %@车 价格:%@",self.name,self.level,self.price];
}

    
@end
