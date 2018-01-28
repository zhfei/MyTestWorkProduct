//
//  UIBarButtonItem+MF.h
//  ManageFinances
//
//  Created by liguowei on 14-7-2.
//  Copyright (c) 2014年 9frame. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (MF)
/**
 *  快速创建一个显示图片的item
 *
 *  @param action   监听方法
 */
+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon target:(id)target action:(SEL)action;
@end
