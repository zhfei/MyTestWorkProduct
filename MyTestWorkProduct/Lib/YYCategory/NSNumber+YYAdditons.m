//
//  NSNumber+YYAdditons.m
//  ManageFinances
//
//  Created by liguowei on 14/12/29.
//  Copyright (c) 2014年 9fbank. All rights reserved.
//

#import "NSNumber+YYAdditons.h"

@implementation NSNumber (YYAdditons)
// 格式化输出数字，使用千位分隔符
-(NSString*)moneyFormat
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    formatter.maximumFractionDigits = 2;
    return [formatter stringFromNumber:self];
}

// 格式化输出数字，使用千位分隔符，保留2位小数
-(NSString*)moneyFormatToZero
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    formatter.maximumFractionDigits = 2;
    formatter.minimumFractionDigits = 2;
    return [formatter stringFromNumber:self];
}
@end
