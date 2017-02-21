//
//  UIImage+Color.h
//  XPay
//
//  Created by jack zhou on 1/19/15.
//  Copyright (c) 2014 jack zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)

+ (UIImage *)imageWithSolidColor:(UIColor *)color size:(CGSize)size;
- (UIImage *)imageWithTintColor:(UIColor *)tintColor;

+ (UIImage *)imageWithColor:(UIColor *)color;

@end
