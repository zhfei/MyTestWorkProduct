//
//  UIImage+MaskImage.h
//  XPay
//
//  Created by jack zhou on 1/19/15.
//  Copyright (c) 2014 jack zhou. All rights reserved.
//
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    KPositionLeft,
    KPositionRight,
} KPosition;

@interface UIImage (MaskImage)
-(UIImage*)imageWithTintColor:(UIColor*)tintColor
                 cornerRadius:(CGFloat)radius;
//在图片上绘制文字
+ (UIImage *)createTextImageWithImageText:( NSString *)imageText imageName:( NSString *)imageName textPosition:(KPosition)textPosition;
@end
