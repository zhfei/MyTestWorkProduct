//
//  CirculateModel.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/8/4.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "CirculateModel.h"

@implementation CirculateModel
+ (instancetype)circulateModel {
    CirculateModel *model = [CirculateModel new];
    model.age = @(10);
    model.name = @"kitty";
    return model;
}
@end
