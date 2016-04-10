//
//  UIView+YYAdditions.m
//  YY
//
//  Created by liguowei on 14-10-14.
//  Copyright (c) 2014年 itbox. All rights reserved.
//

#import "UIView+YYAdditions.h"

@implementation UIView (YYAdditions)
-(void)removeAllSubviews{
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
}

-(void) addBorderWithColor:(UIColor *) color width:(float) width radius:(float) radius{
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = width;
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}

- (void)rightByView:(UIView *)view spacing:(float)spacing
{
    CGRect frame = self.frame;
    frame.origin.x = CGRectGetMaxX(view.frame) + spacing;
    self.frame = frame;
}
@end
