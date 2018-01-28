//
//  CarLicenseFactory.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/7.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "CarLicenseFactory.h"


@implementation CarLicenseFactory
/*!
 *  @author zhoufei
 *
 *  @brief 简单工厂方法
 *  @param carLicenseType 车牌类型
 *  @return 具体车牌实例
 */
+ (CarLicense *)createCarLicenseWithCarLicenseType:(CarLicenseType)carLicenseType {

    CarLicense * carLicense = [CarLicense new];
    
    if (carLicenseType == CarLicenseBlue) {
        carLicense = [BlueCarLicense new];
    } else if (carLicenseType == CarLicenseYellow) {
        carLicense = [YellowCarLicense new];
    }
    
    return carLicense;
}
@end
