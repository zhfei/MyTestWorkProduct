//
//  Director.h
//  MyTestWorkProduct
//
//  Created by xuyefeng on 17/5/11.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BuickBuilder.h"
#import "BuickCar.h"

@interface Director : NSObject
    
    // 根据客户的要求介绍一辆别克车
+ (BuickCar *)creatBuickCar:(BuickBuilder *)builder;


@end
