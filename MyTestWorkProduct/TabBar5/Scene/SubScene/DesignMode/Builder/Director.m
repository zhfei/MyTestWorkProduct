//
//  Director.m
//  MyTestWorkProduct
//
//  Created by xuyefeng on 17/5/11.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "Director.h"

@implementation Director

    // 根据客户的要求介绍一辆别克车
+ (BuickCar *)creatBuickCar:(BuickBuilder *)builder {

     return [builder makeBuickCar];
}
    
@end
