//
//  UIView+YYAdditions.h
//  YY
//
//  Created by liguowei on 14-10-14.
//  Copyright (c) 2014年 itbox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YYAdditions)
// 移除所有子视图
-(void) removeAllSubviews;
// 添加边框
-(void) addBorderWithColor:(UIColor *) color width:(float) width radius:(float) radius;

// 自动靠在某一个试图的右边，spacing：距离
-(void)rightByView:(UIView *)view spacing:(float)spacing;


@end
