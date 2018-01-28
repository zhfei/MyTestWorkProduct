//
//  UIButton+ImageTitle.m
//  Coffee
//
//  Created by LiiHen on 16/4/18.
//  Copyright © 2016年 XPay. All rights reserved.
//

#import "UIButton+ImageTitle.h"

@implementation UIButton (ImageTitle)

#pragma mark - 水平方向(居中)对齐

/**
 *  水平居中(左文字,右图片)
 *  @param title
 *  @param image 图片
 *  @param space 文字
 */
- (void)horizontal_Title:(NSString *)title image:(UIImage *)image withSpace:(float)space {
    
    [self x_ConfigureButtonWithTitle:title image:image];
    [self x_ResetEdgeInsets];
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    CGRect contentRect = [self contentRectForBounds:self.bounds];
    CGSize titleSize = [self titleRectForContentRect:contentRect].size;
    CGSize imageSize = [self imageRectForContentRect:contentRect].size;
    
    [self setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, space)];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -imageSize.width, 0, imageSize.width)];
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, titleSize.width+space, 0, -titleSize.width - space)];
}

/**
 *  水平居中(左图片,右文字)
 *  @param title
 *  @param image 图片
 *  @param space 文字
 */
- (void)horizontal_Image:(UIImage *)image title:(NSString *)title withSpace:(float)space {
    
    [self x_ConfigureButtonWithTitle:title image:image];
    [self x_ResetEdgeInsets];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, space, 0, -space)];
    [self setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, space)];
}

#pragma mark - 垂直方向(居中)对齐
/**
 *  垂直居中(上面文字,下面图片)
 *  @param title
 *  @param image 图片
 *  @param space 文字
 */
- (void)vertical_Title:(NSString *)title image:(UIImage *)image withSpace:(float)space {
    [self verticalAlignmentWithTitle:title image:image isTitleOnTop:YES space:space];
}

/**
 *  垂直居中(上面图片,下面文字)
 *  @param title
 *  @param image 图片
 *  @param space 文字
 */
- (void)vertical_Image:(UIImage *)image title:(NSString *)title withSpace:(float)space {
    [self verticalAlignmentWithTitle:title image:image isTitleOnTop:NO space:space];
}

/**
 *  垂直居中对齐
 *  @param title    文字
 *  @param image    图片
 *  @param titleTop 文字是否在图片上方
 *  @param space    两者间隔
 */
- (void)verticalAlignmentWithTitle:(NSString *)title image:(UIImage *)image isTitleOnTop:(BOOL)titleTop space:(float)space {
    [self x_ConfigureButtonWithTitle:title image:image];
    [self x_ResetEdgeInsets];
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    CGRect contentRect = [self contentRectForBounds:self.bounds];
    CGSize titleSize = [self titleRectForContentRect:contentRect].size;
    CGSize imageSize = [self imageRectForContentRect:contentRect].size;
    
    float halfWidth = (titleSize.width + imageSize.width)/2;
    float halfHeight = (titleSize.height + imageSize.height)/2;
    
    float topInset = MIN(halfHeight, titleSize.height);
    float leftInset = (titleSize.width - imageSize.width)>0?(titleSize.width - imageSize.width)/2:0;
    float bottomInset = (titleSize.height - imageSize.height)>0?(titleSize.height - imageSize.height)/2:0;
    float rightInset = MIN(halfWidth, titleSize.width);
    
    if (titleTop) {
        [self setTitleEdgeInsets:UIEdgeInsetsMake(-halfHeight-space, - halfWidth, halfHeight+space, halfWidth)];
        [self setContentEdgeInsets:UIEdgeInsetsMake(topInset+space, leftInset, -bottomInset, -rightInset)];
    } else {
        [self setTitleEdgeInsets:UIEdgeInsetsMake(halfHeight+space, - halfWidth, -halfHeight-space, halfWidth)];
        [self setContentEdgeInsets:UIEdgeInsetsMake(-bottomInset, leftInset, topInset+space, -rightInset)];
    }
}

#pragma mark - Common Method
- (void)x_ConfigureButtonWithTitle:(NSString *)title image:(UIImage *)image {
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self setImage:image forState:UIControlStateNormal];
}

- (void)x_ResetEdgeInsets {
    [self setContentEdgeInsets:UIEdgeInsetsZero];
    [self setImageEdgeInsets:UIEdgeInsetsZero];
    [self setTitleEdgeInsets:UIEdgeInsetsZero];
}

@end
