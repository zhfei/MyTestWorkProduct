//
//  ZFButton.h
//  MyTestWorkProduct
//
//  Created by xuyefeng on 17/6/15.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ZFButtonTypeCenterImageCenterTitle,
    ZFButtonTypeRightImageLeftTitle,
    ZFButtonTypeCenterImageNoneTitle,
} ZFButtonType;

@interface ZFButton : UIButton
+ (instancetype)zfButtonWithType:(ZFButtonType)buttonType;

- (void)updateButtonStyleWithType:(ZFButtonType)buttonType;
@end
