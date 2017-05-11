//
//  BuickExcelleGTBuilder.m
//  MyTestWorkProduct
//
//  Created by xuyefeng on 17/5/11.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "BuickExcelleGTBuilder.h"

@implementation BuickExcelleGTBuilder
- (instancetype)init
    {
        self = [super init];
        if (self) {
            self.name = @"别克英朗";
            self.level = @"A级车";
            self.price = @"10.99-15.99万";
        }
        return self;
    }

@end
