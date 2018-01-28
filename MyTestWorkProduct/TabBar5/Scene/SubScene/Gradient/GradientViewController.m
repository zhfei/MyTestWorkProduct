//
//  GradientViewController.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/6/18.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "GradientViewController.h"
#import <Masonry/Masonry.h>
#import "gradientView1.h"
#import "gradientView2.h"
#import "gradientView3.h"


@interface GradientViewController ()
@property (strong, nonatomic)gradientView1   *firstCircle;
@property (strong, nonatomic)CAShapeLayer  *firstCircleShapeLayer;


@end

@implementation GradientViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    gradientView1 * gv1 = [[gradientView1 alloc] init];
    [self.view addSubview:gv1];
    [gv1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.and.right.mas_equalTo(0);
        make.height.mas_equalTo(20);
    }];
    
    gradientView2 * gv2 = [[gradientView2 alloc] init];
    [self.view addSubview:gv2];
    [gv2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.mas_equalTo(0);
        make.height.mas_equalTo(70);
        make.top.mas_equalTo(gv1.mas_bottom).offset(10);
    }];
    
    gradientView3 * gv3 = [[gradientView3 alloc] init];
    [self.view addSubview:gv3];
    [gv3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.mas_equalTo(0);
        make.height.mas_equalTo(110);
        make.top.mas_equalTo(gv2.mas_bottom).offset(10);
    }];
    
    
    CGFloat firsCircleWidth = 5;
    self.firstCircleShapeLayer = [self generateShapeLayerWithLineWidth:firsCircleWidth];
    self.firstCircleShapeLayer.path = [self generateBezierPathWithCenter:CGPointMake(100, 100) radius:100].CGPath;
    self.firstCircle.layer.mask = self.firstCircleShapeLayer;
    [self.view addSubview:self.firstCircle];
    [self.firstCircle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.mas_equalTo(0);
        make.height.mas_equalTo(220);
        make.top.mas_equalTo(gv3.mas_bottom).offset(10);
    }];

}

- (CAShapeLayer *)generateShapeLayerWithLineWidth:(CGFloat)lineWidth
{
    CAShapeLayer *waveline = [CAShapeLayer layer];
    waveline.lineCap = kCALineCapButt;
    waveline.lineJoin = kCALineJoinRound;
    waveline.strokeColor = [UIColor redColor].CGColor;
    waveline.fillColor = [[UIColor clearColor] CGColor];
    waveline.lineWidth = lineWidth;
    waveline.backgroundColor = [UIColor clearColor].CGColor;
    
    return waveline;
}

- (UIBezierPath *)generateBezierPathWithCenter:(CGPoint)center radius:(CGFloat)radius
{
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:2*M_PI clockwise:NO];
    
    return circlePath;
}

- (gradientView1 *)firstCircle
{
    if (!_firstCircle) {
        _firstCircle = [[gradientView1 alloc] init];
        _firstCircle.layer.masksToBounds = YES;
        _firstCircle.alpha = 1.0;
    }
    
    return _firstCircle;
}

@end
