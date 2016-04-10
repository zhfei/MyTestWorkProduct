//
//  UILabel+YYAdditions.m
//  YY
//
//  Created by liguowei on 14-10-14.
//  Copyright (c) 2014年 itbox. All rights reserved.
//

#import "UILabel+YYAdditions.h"

@implementation UILabel (YYAdditions)
+ (UILabel *)labelWithtext:(NSString *)text frame:(CGRect)frame font:(UIFont *)font textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor textAlignment:(NSTextAlignment)textAlignment
{
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.frame = frame;
    label.font = font;
    label.textAlignment = textAlignment;
    label.textColor = textColor;
    label.backgroundColor = backgroundColor;
    return label;
}
@end
