//
//  AtBeiJingCarLicenseFactory.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/7.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "AtBeiJingCarLicenseFactory.h"
#import "AtBeiJingBlueCarLicense.h"
#import "AtBeiJingYellowCarLicense.h"

@implementation AtBeiJingCarLicenseFactory
/*!
 *  @author zhoufei
 *
 *  @brief 创建蓝牌照
 *  @return 蓝牌照实例
 */
+ (BlueCarLicense *)createBlueCarLicense {
    
    AtBeiJingBlueCarLicense * blue = [AtBeiJingBlueCarLicense new];
    
    return blue;
}

/*!
 *  @author zhoufei
 *
 *  @brief 创建黄牌照
 *  @return 黄牌照实例
 */
+ (YellowCarLicense *)createYellowCarLicense {
    
    AtBeiJingYellowCarLicense * yellow = [AtBeiJingYellowCarLicense new];
    
    return yellow;
}

@end
