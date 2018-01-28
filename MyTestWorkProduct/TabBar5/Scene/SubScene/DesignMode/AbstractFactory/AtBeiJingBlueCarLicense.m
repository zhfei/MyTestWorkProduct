//
//  AtBeiJingBlueCarLicense.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/7.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "AtBeiJingBlueCarLicense.h"
#import "Tools.h"

@implementation AtBeiJingBlueCarLicense
- (NSString *)printCarLicenseNumber {
    
    return [Tools getLicenseNumberWithCity:@"京"];
}
@end
