//
//  AtCarLicenseFactory.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/7.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BlueCarLicense.h"
#import "YellowCarLicense.h"

@interface AtCarLicenseFactory : NSObject

/*!
 *  @author zhoufei
 *
 *  @brief 创建蓝牌照
 *  @return 蓝牌照实例
 */
+ (BlueCarLicense *)createBlueCarLicense;

/*!
 *  @author zhoufei
 *
 *  @brief 创建黄牌照
 *  @return 黄牌照实例
 */
+ (YellowCarLicense *)createYellowCarLicense;

@end
