//
//  BuickBuilder.m
//  MyTestWorkProduct
//
//  Created by xuyefeng on 17/5/11.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "BuickBuilder.h"

@implementation BuickBuilder

- (BuickCar *)makeBuickCar{
    
    BuickCar *buickCar = [[BuickCar alloc] init];
    buickCar.name = self.name;
    buickCar.level = self.level;
    buickCar.price = self.price;
    
    return buickCar;
}
    
@end
