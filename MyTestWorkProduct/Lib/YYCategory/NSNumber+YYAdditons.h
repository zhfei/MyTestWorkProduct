//
//  NSNumber+YYAdditons.h
//  ManageFinances
//
//  Created by liguowei on 14/12/29.
//  Copyright (c) 2014年 9fbank. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (YYAdditons)

/**
 *  格式化输出数字，使用千位分隔符，例如: 1,234
 */
-(NSString *)moneyFormat;

/**
 *  格式化输出数字，使用千位分隔符，保留2位小数，例如: 1,234.00
 */
-(NSString *)moneyFormatToZero;
@end
