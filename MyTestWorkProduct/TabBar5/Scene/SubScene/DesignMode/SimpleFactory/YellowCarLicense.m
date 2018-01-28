//
//  YellowCarLicense.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/7.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "YellowCarLicense.h"

@implementation YellowCarLicense

- (NSString *)printCarLicenseNumber {

    [super printCarLicenseNumber];
    
    return [NSString stringWithFormat:@"黄车牌:%@",self.carLicenseNumber];
}

@end
