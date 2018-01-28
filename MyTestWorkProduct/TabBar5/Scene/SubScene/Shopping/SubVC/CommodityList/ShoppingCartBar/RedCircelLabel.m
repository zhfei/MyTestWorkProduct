//
//  RedCircelLabel.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/6/5.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "RedCircelLabel.h"

@implementation RedCircelLabel

+ (instancetype)redCircelLabel {

    RedCircelLabel * redCircelLabel = [RedCircelLabel new];
    UILabel * textLabel = [UILabel new];
    textLabel.tag = 222;
    [redCircelLabel addSubview:textLabel];
    
    return redCircelLabel;
}

- (void)setText:(NSString *)text {

    UILabel * label = [self viewWithTag:222];
    label.text = text;
}

- (NSString *)text {

    UILabel * label = [self viewWithTag:222];
    return label.text;
}

- (void)setLableFrame:(CGRect)lableFrame {

    [self setFrame:lableFrame];
    UILabel * label = [self viewWithTag:222];
    [label setFrame:self.bounds];

}

- (void)resetViewWithFrame:(CGRect)frame {
    
    
    CAShapeLayer * shapeLayer = [CAShapeLayer layer];
    
    UIBezierPath * bezier = [UIBezierPath bezierPathWithRoundedRect:frame cornerRadius:frame.size.width*0.5];
    shapeLayer.path = bezier.CGPath;
    shapeLayer.fillColor = [UIColor redColor].CGColor;
    [self.layer addSublayer:shapeLayer];
}


@end
