//
//  UIView+Image.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/3/12.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    KPositionLeft,
    KPositionRight,
} KPosition;

@interface UIView (Image)
- (UIImage *)createTextImageWithImageText:( NSString *)imageText imageName:( NSString *)imageName textPosition:(KPosition)textPosition;

- (UIImage *)imageFromTheView:(UIView*)view;

+ (void)addSimpleReflectionToView:(UIView *)theView ;

+ (CGImageRef) createGradientImage:(CGSize)size;
+ (UIImage *) reflectionOfView:(UIView *)theView WithPercent:(CGFloat) percent;

@end
