//
//  YellowCarLicenseFactory.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/7.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "YellowCarLicenseFactory.h"
#import "YellowCarLicense.h"


@implementation YellowCarLicenseFactory
+ (CarLicense *)createCarLicense {
    
    YellowCarLicense * yellow = [YellowCarLicense new];
    return yellow;
}

@end
