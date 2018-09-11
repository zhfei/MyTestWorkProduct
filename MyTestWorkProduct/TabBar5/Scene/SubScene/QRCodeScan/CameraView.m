//
//  CameraView.m
//  MyTestWorkProduct
//
//  Created by 周飞 on 2018/9/10.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

#import "CameraView.h"

#define Color [UIColor blueColor]

@interface CameraView ()
@property (assign,nonatomic)CGRect cutRect;
@end


@implementation CameraView

-(id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        // 中间空心洞的区域
        self.cutRect = CGRectMake(CGRectGetMidX(frame) - 115,
                                  CGRectGetMidY(frame) - 115 - 30,
                                  230,
                                  230);
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:frame];
        // 挖空心洞 显示区域
        UIBezierPath *cutRectPath = [UIBezierPath bezierPathWithRect:self.cutRect];
        //        将circlePath添加到path上
        [path appendPath:cutRectPath];
        path.usesEvenOddFillRule = YES;
        
        CAShapeLayer *fillLayer = [CAShapeLayer layer];
        fillLayer.path = path.CGPath;
        fillLayer.fillRule = kCAFillRuleEvenOdd;
        fillLayer.opacity = 0.5;//透明度
        fillLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
        [self.layer addSublayer:fillLayer];
        
        // 边界校准线
        const CGFloat lineWidth = 2;
        UIBezierPath *linePath = [UIBezierPath bezierPathWithRect:CGRectMake(self.cutRect.origin.x - lineWidth,
                                                                             self.cutRect.origin.y - lineWidth,
                                                                             self.cutRect.size.width / 4.0,
                                                                             lineWidth)];
        //        追加路径
        [linePath appendPath:[UIBezierPath bezierPathWithRect:CGRectMake(self.cutRect.origin.x - lineWidth,
                                                                         self.cutRect.origin.y - lineWidth,
                                                                         lineWidth,
                                                                         self.cutRect.size.height / 4.0)]];
        
        [linePath appendPath:[UIBezierPath bezierPathWithRect:CGRectMake(self.cutRect.origin.x + 230 - self.cutRect.size.width / 4.0 + lineWidth,
                                                                         self.cutRect.origin.y - lineWidth,
                                                                         self.cutRect.size.width / 4.0,
                                                                         lineWidth)]];
        [linePath appendPath:[UIBezierPath bezierPathWithRect:CGRectMake(self.cutRect.origin.x + 230 ,
                                                                         self.cutRect.origin.y - lineWidth,
                                                                         lineWidth,
                                                                         self.cutRect.size.height / 4.0)]];
        
        [linePath appendPath:[UIBezierPath bezierPathWithRect:CGRectMake(self.cutRect.origin.x - lineWidth,
                                                                         self.cutRect.origin.y + 230 - self.cutRect.size.height / 4.0 + lineWidth,
                                                                         lineWidth,
                                                                         self.cutRect.size.height / 4.0)]];
        [linePath appendPath:[UIBezierPath bezierPathWithRect:CGRectMake(self.cutRect.origin.x - lineWidth,
                                                                         self.cutRect.origin.y + 230,
                                                                         self.cutRect.size.width / 4.0,
                                                                         lineWidth)]];
        
        [linePath appendPath:[UIBezierPath bezierPathWithRect:CGRectMake(self.cutRect.origin.x + 230,
                                                                         self.cutRect.origin.y + 230 - self.cutRect.size.height / 4.0 + lineWidth,
                                                                         lineWidth,
                                                                         self.cutRect.size.height / 4.0)]];
        [linePath appendPath:[UIBezierPath bezierPathWithRect:CGRectMake(self.cutRect.origin.x + 230 - self.cutRect.size.width / 4.0 + lineWidth,
                                                                         self.cutRect.origin.y + 230,
                                                                         self.cutRect.size.width / 4.0,
                                                                         lineWidth)]];
        
        CAShapeLayer *pathLayer = [CAShapeLayer layer];
        pathLayer.path = linePath.CGPath;// 从贝塞尔曲线获取到形状
        pathLayer.fillColor = Color.CGColor; // 闭环填充的颜色
        //        pathLayer.lineCap       = kCALineCapSquare;               // 边缘线的类型
        //        pathLayer.strokeColor = [UIColor blueColor].CGColor; // 边缘线的颜色
        //        pathLayer.lineWidth     = 4.0f;                           // 线条宽度
        [self.layer addSublayer:pathLayer];
        
        //        扫描条动画
        UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(self.cutRect.origin.x,
                                                                          self.cutRect.origin.y,
                                                                          self.cutRect.size.width,
                                                                          lineWidth)];
        line.image = [[UIImage imageNamed:@"line"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        line.tintColor = Color;
        [self addSubview:line];
        
        // 上下游走动画
        CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
        animation.fromValue = @0;
        animation.toValue = [NSNumber numberWithFloat:self.cutRect.size.height];
        animation.autoreverses = YES;
        animation.duration = 3;
        animation.repeatCount = FLT_MAX;
        [line.layer addAnimation:animation forKey:nil];
        
    }
    return self;
}


@end
