//
//  BuickBuilder.h
//  MyTestWorkProduct
//
//  Created by xuyefeng on 17/5/11.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BuickCar.h"

@interface BuickBuilder : NSObject

@property (nonatomic, copy)NSString *name;// 名字
@property (nonatomic, copy)NSString *level;// 级别
@property (nonatomic, copy)NSString *price;// 价格
    
- (BuickCar *)makeBuickCar;
    
@end
