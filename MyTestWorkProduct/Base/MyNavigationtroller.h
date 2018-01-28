//
//  MyNavigationtroller.h
//  xueba
//
//  Created by Tim on 12/6/14.
//  Copyright (c) 2014 aim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyNavigationtroller : UINavigationController

//返回按钮
+(void)createBackBtn:(UIViewController*)target;

//左按钮 图片
+(void)createLeftBtnImage:(UIImage*)image target:(id)target action:(SEL)selector;
//左按钮 文字
+(void)createLeftBtnTitle:(NSString*)title target:(UIViewController*)target action:(SEL)selector;

//右按钮 图片
+(void)createRightBtnImage:(UIImage*)image target:(id)target action:(SEL)selector;
//右按钮 文字
+(void)createRightBtnTitle:(NSString*)title target:(UIViewController*)target action:(SEL)selector;

//右按钮 两个图片
+(void)createRightBtnImages:(NSArray*)imagesArray target:(UIViewController*)target action1:(SEL)selector1 action2:(SEL)selector2;

+(void)createRightBtnButt:(NSArray *)butt target:(UIViewController *)target action1:(SEL)selector1 action2:(SEL)selector2 andTitle:(NSString *)title;

//+ (void)createRightBtnButt:(NSArray *)butt target:(UIViewController *)target action1:(SEL)selector1 action2:(SEL)selector2;

+ (void)createBackBtnNil:(UIViewController *)target;

@end
