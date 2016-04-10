//
//  UIButton+YYAdditions.m
//  YY
//
//  Created by liguowei on 14-10-14.
//  Copyright (c) 2014年 itbox. All rights reserved.
//

#import "UIButton+YYAdditions.h"

@implementation UIButton (YYAdditions)
+ (UIButton *)buttonWithFrame:(CGRect)frame backgroundImageWithColor:(UIColor *)color highBackgroundImageWithColor:(UIColor *)highColor;
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setBackgroundImage:[UIImage imageWithColor:color] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageWithColor:highColor] forState:UIControlStateHighlighted];
    return btn;
}
+ (UIButton *)buttonWithTitle:(NSString *)title font:(NSInteger)font frame:(CGRect)frame backgroundImage:(UIImage *)image highBackgroundImage:(UIImage *)highImage
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:font];
    btn.frame = frame;
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    [btn setBackgroundImage:highImage forState:UIControlStateHighlighted];
    return btn;
}

@end
