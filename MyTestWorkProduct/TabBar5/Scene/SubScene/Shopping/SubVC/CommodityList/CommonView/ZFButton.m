//
//  ZFButton.m
//  MyTestWorkProduct
//
//  Created by xuyefeng on 17/6/15.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "ZFButton.h"

@interface ZFButton ()
@property (assign, nonatomic)ZFButtonType type;
@end

@implementation ZFButton
- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.type == ZFButtonTypeCenterImageCenterTitle) {
        [self resetBtnCenterImageCenterTitle];
    } else if (self.type == ZFButtonTypeLeftImageNoneTitle) {
        [self resetBtnLeftImageNotTitle];
    } else if (self.type == ZFButtonTypeRightImageLeftTitle) {
        [self resetBtnRightImageLeftTitle];
    }
}

#pragma mark - gongyou
+ (instancetype)zfButtonWithType:(ZFButtonType)buttonType {

    ZFButton * btn = [ZFButton buttonWithType:UIButtonTypeCustom];
    btn.type = buttonType;
    
    return btn;
}

- (void)updateButtonStyleWithType:(ZFButtonType)buttonType {

    self.type = buttonType;
    [self layoutSubviews];
}

#pragma mark - 私有方法
/*!**方式二***/
- (void)resetBtnCenterImageCenterTitle {
    
    self.imageView.frame = self.bounds;
    [self.imageView setContentMode:UIViewContentModeCenter];
    
    self.titleLabel.frame = self.bounds;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)resetBtnLeftImageNotTitle {
    
    CGRect frame = self.bounds;
    frame.size.width *= 0.5;
    self.imageView.frame = frame;
    [self.imageView setContentMode:UIViewContentModeCenter];
    
    self.titleLabel.frame = CGRectZero;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)resetBtnRightImageLeftTitle {
    
    CGRect frame = self.bounds;
    frame.size.width *= 0.5;
    self.titleLabel.frame = frame;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    frame.origin.x = (self.bounds.size.width - frame.size.width);
    self.imageView.frame = frame;
    [self.imageView setContentMode:UIViewContentModeCenter];
}



/*!**方式一***/
- (void)updateBtnStyle_rightImage:(UIButton *)btn {
    
    CGFloat btnImageWidth = btn.imageView.bounds.size.width;
    CGFloat btnLabelWidth = btn.titleLabel.bounds.size.width;
    CGFloat margin = 3;
    
    btnImageWidth += margin;
    btnLabelWidth += margin;
    
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -btnImageWidth, 0, btnImageWidth)];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, btnLabelWidth, 0, -btnLabelWidth)];
}



@end
