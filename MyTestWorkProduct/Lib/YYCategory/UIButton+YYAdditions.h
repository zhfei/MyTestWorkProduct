//
//  UIButton+YYAdditions.h
//  YY
//
//  Created by liguowei on 14-10-14.
//  Copyright (c) 2014年 itbox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (YYAdditions)
/**
 *  快速创建一个btn
 *
 *  @param frame     frame
 *  @param color     color
 *  @param highColor highColor
 *
 *  @return UIButton
 */
+ (UIButton *)buttonWithFrame:(CGRect)frame backgroundImageWithColor:(UIColor *)color highBackgroundImageWithColor:(UIColor *)highColor;
/**
 *  快速创建一个btn
 *
 *  @param title     title
 *  @param font      font
 *  @param frame     frame
 *  @param image     image
 *  @param highImage highImage
 *
 *  @return UIButton
 */
+ (UIButton *)buttonWithTitle:(NSString *)title font:(NSInteger)font frame:(CGRect)frame backgroundImage:(UIImage *)image highBackgroundImage:(UIImage *)highImage;
@end
