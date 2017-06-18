//
//  ZFButton.h
//  MyTestWorkProduct
//
//  Created by xuyefeng on 17/6/15.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ZFButtonTypeCenterImageCenterTitle,//图片，文字都居中
    ZFButtonTypeRightImageLeftTitle,//图片右，文字左
    ZFButtonTypeLeftImageNoneTitle,//图片左，文字无
} ZFButtonType;

@interface ZFButton : UIButton
+ (instancetype)zfButtonWithType:(ZFButtonType)buttonType;

- (void)updateButtonStyleWithType:(ZFButtonType)buttonType;
@end
