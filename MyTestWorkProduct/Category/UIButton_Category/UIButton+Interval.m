//
//  UIButton+Interval.m
//  MyTestWorkProduct
//
//  Created by xuyefeng on 16/4/23.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "UIButton+Interval.h"

@implementation UIButton (Interval)

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addTarget:self action:@selector(touchDownAction) forControlEvents:UIControlEventTouchDown];
    }
    return self;
}

- (void)touchDownAction
{
    self.enabled=NO;
    [self performSelector:@selector(btnDelayAction) withObject:nil afterDelay:1];
}

- (void)btnDelayAction
{
   self.enabled=YES;
}

- (void)dealloc
{
    [self removeTarget:self action:@selector(touchDownAction) forControlEvents:UIControlEventTouchDown];
}


@end
