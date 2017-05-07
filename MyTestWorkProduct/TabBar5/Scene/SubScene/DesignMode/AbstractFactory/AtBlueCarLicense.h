//
//  AtBlueCarLicense.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/7.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CarLicenseProtocol.h"

@interface AtBlueCarLicense : NSObject<CarLicenseProtocol>
@property(nonatomic, copy)NSString              *city; // 城市

@end
