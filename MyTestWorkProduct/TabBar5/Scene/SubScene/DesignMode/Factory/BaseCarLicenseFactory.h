//
//  BaseCarLicenseFactory.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/7.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CarLicense.h"

@interface BaseCarLicenseFactory : NSObject

+ (CarLicense *)createCarLicense;

@end
