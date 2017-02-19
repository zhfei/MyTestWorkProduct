//
//  UIColor+Hexadecimal.h
//  Applications
//
//  Created by Ignacio on 6/7/14.
//  Copyright (c) 2014 DZN Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hexadecimal)

+ (UIColor *)colorWithHex:(NSString *)string;
/*!
 *  @author zhoufei
 *
 *  @brief 随机色
 *
 *  @return 返回的颜色对象
 */
+ (UIColor *)randomColor;

@end
