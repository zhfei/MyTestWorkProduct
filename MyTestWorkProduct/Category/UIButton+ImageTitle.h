//
//  UIButton+ImageTitle.h
//  Coffee
//
//  Created by LiiHen on 16/4/18.
//  Copyright © 2016年 XPay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ImageTitle)

//水平方向(居中)对齐
- (void)horizontal_Title:(NSString *)title image:(UIImage *)image withSpace:(float)space;
- (void)horizontal_Image:(UIImage *)image title:(NSString *)title withSpace:(float)space;

//垂直方向(居中)对齐
- (void)vertical_Title:(NSString *)title image:(UIImage *)image withSpace:(float)space;
- (void)vertical_Image:(UIImage *)image title:(NSString *)title withSpace:(float)space;
@end
