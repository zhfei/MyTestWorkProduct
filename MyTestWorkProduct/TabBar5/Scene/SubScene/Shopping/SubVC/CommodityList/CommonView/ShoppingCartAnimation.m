//
//  ShoppingCartAnimation.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/27.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "ShoppingCartAnimation.h"

@implementation ShoppingCartAnimation

//+ (ShoppingCartAnimation*)sharedShoppingCartAnimation {
//
//    static ShoppingCartAnimation * shoppingCartAnimation;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        shoppingCartAnimation = [ShoppingCartAnimation new];
//    });
//    
//    return shoppingCartAnimation;
//}

+ (void)arcMoveFromView:(UIView*)fromView toView:(UIView*)targeView {
    
    CGPoint startPoint = [fromView convertPoint:fromView.center toView:[[UIApplication sharedApplication].delegate window]];

    CGPoint endPoint = [targeView convertPoint:targeView.center toView:[[UIApplication sharedApplication].delegate window]];
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.delegate = self;
    pathAnimation.calculationMode = kCAAnimationPaced;
    
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.duration = 0.5;
    pathAnimation.repeatCount = 1;
    
    CGMutablePathRef curvedPath = CGPathCreateMutable();
    CGPathMoveToPoint(curvedPath, NULL, startPoint.x, startPoint.y);
    CGPathAddQuadCurveToPoint(curvedPath, NULL, startPoint.x - 100, startPoint.y - 200, endPoint.x, endPoint.y);
    
    pathAnimation.path = curvedPath;
    CGPathRelease(curvedPath);
    
    UIView *circleView = [[UIView alloc] initWithFrame:CGRectMake(1, 1, 15, 15)];
    circleView.layer.masksToBounds = YES;
    circleView.layer.cornerRadius = 7.5;
    circleView.backgroundColor = [UIColor redColor];
    [[[UIApplication sharedApplication].delegate window] addSubview:circleView];
    
    [circleView.layer addAnimation:pathAnimation forKey:@"moveTheSquare"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{

    
}

@end
