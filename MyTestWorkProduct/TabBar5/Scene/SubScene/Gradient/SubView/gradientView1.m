//
//  gradientView1.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/6/18.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "gradientView1.h"

@implementation gradientView1
- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.layer.sublayers makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
    [self resetContext];
}

- (void)resetContext {

    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor yellowColor].CGColor, (__bridge id)[UIColor blueColor].CGColor];
    gradientLayer.locations = @[@0.3, @0.5, @1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = self.bounds;
    [self.layer addSublayer:gradientLayer];
}

@end
