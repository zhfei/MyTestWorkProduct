//
//  CarLicenseFactory.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/7.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BlueCarLicense.h"
#import "YellowCarLicense.h"

typedef enum : NSUInteger {
    CarLicenseBlue,
    CarLicenseYellow,
} CarLicenseType;

@interface CarLicenseFactory : NSObject
/*!
 *  @author zhoufei
 *
 *  @brief 简单工厂方法
 *  @param carLicenseType 车牌类型
 *  @return 具体车牌实例
 */
+ (CarLicense *)createCarLicenseWithCarLicenseType:(CarLicenseType)carLicenseType;

@end
