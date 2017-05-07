//
//  CarLicense.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/7.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CarLicenseProtocol.h"

@interface CarLicense : NSObject <CarLicenseProtocol>

@property (copy,nonatomic)NSString *city;
@property (copy,nonatomic,readonly)NSString *carLicenseNumber;

@end
