//
//  ShoppingCartAnimation.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/27.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShoppingCartAnimation : NSObject <CAAnimationDelegate>

//+ (ShoppingCartAnimation*)sharedShoppingCartAnimation;

+ (void)arcMoveFromView:(UIView*)fromView toView:(UIView*)targeView;

@end
