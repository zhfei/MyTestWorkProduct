//
//  BlueCarLicense.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/7.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "BlueCarLicense.h"

@implementation BlueCarLicense

- (NSString *)printCarLicenseNumber {

    [super printCarLicenseNumber];
    
    return [NSString stringWithFormat:@"蓝车牌:%@",self.carLicenseNumber];
}

@end
