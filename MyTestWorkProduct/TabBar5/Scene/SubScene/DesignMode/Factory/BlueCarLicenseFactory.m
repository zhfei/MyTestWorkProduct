//
//  BlueCarLicenseFactory.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/7.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "BlueCarLicenseFactory.h"
#import "BlueCarLicense.h"

@implementation BlueCarLicenseFactory

+ (CarLicense *)createCarLicense {
    
    BlueCarLicense * blue = [BlueCarLicense new];
    return blue;
}


@end
