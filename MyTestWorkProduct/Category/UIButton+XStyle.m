//
//  UIButton+Style.m
//  poscash
//
//  Created by wjx on 15/7/15.
//  Copyright (c) 2015年 wjx. All rights reserved.
//

#import "UIButton+XStyle.h"

@implementation UIButton (XStyle)

- (void)blueStyle {
    self.layer.cornerRadius = 5.0;
    self.layer.masksToBounds = YES;
    [self setAdjustsImageWhenHighlighted:NO];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.backgroundColor = RGB(0, 156, 229);
    [self setBackgroundImage:[self buttonImageFromColor:RGB(0, 156, 229)] forState:UIControlStateNormal];
    [self setBackgroundImage:[self buttonImageFromColor:RGB(177, 221, 242)] forState:UIControlStateDisabled];
}

- (void)whiteStyle {
    [self.layer setBorderWidth:0.5];
    [self.layer setBorderColor:[RGB(0, 156, 229) CGColor]];
    self.layer.cornerRadius = 5.0;
    self.layer.masksToBounds = YES;
    [self setAdjustsImageWhenHighlighted:NO];
    [self setTitleColor:RGB(0, 156, 229) forState:UIControlStateNormal];
    self.backgroundColor = [UIColor whiteColor];
    [self setBackgroundImage:[self buttonImageFromColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [self setBackgroundImage:[self buttonImageFromColor:[UIColor lightGrayColor]] forState:UIControlStateDisabled];
}

- (UIImage *) buttonImageFromColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}
- (void)blueBorderStyle {
    self.layer.borderWidth = 0.5;
    [self setTitleColor:RGB(0, 156, 229) forState:UIControlStateNormal];;
    self.layer.borderColor = RGB(0, 156, 229).CGColor;
}
- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
  
}

@end
