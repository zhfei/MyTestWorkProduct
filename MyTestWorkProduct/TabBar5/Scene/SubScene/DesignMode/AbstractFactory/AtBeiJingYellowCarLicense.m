//
//  AtBeiJingYellowCarLicense.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/7.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "AtBeiJingYellowCarLicense.h"
#import "Tools.h"

@implementation AtBeiJingYellowCarLicense
- (NSString *)printCarLicenseNumber {
    
    return [Tools getLicenseNumberWithCity:@"京"];
}
@end
