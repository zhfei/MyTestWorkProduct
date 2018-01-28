//
//  MyCollectionCell.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 15/11/9.
//  Copyright © 2015年 zhoufei. All rights reserved.
//

#import "MyCollectionCell.h"
#import "Masonry.h"

@interface MyCollectionCell()

@end

@implementation MyCollectionCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    self.contentView.layer.cornerRadius=5.f;
    self.contentView.layer.borderWidth=1.f;
    self.contentView.layer.borderColor=[UIColor lightGrayColor].CGColor;
    self.contentView.layer.masksToBounds=YES;
    
    UITextView *textV =[[UITextView alloc]init];
    [textV setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:textV];
    textV.textAlignment=NSTextAlignmentCenter;
    [textV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    textV.font=[UIFont systemFontOfSize:18];
    textV.userInteractionEnabled=NO;
    self.textV=textV;
}

- (void)drawRect:(CGRect)rect
{
//    UIColor *blue =[UIColor blueColor];
//    
//    [blue set];
    
    
    
//    UIBezierPath *bezier =[UIBezierPath bezierPath];
//    
//    bezier.lineWidth=2;
//    bezier.lineCapStyle=kCGLineCapRound;
//    bezier.lineJoinStyle=kCGLineJoinRound;
//    
//    [bezier moveToPoint:CGPointMake(50, 5)];
//    
//    [bezier addLineToPoint:CGPointMake(90, 25)];
//    [bezier addLineToPoint:CGPointMake(75, 50)];
//    [bezier addLineToPoint:CGPointMake(25, 50)];
//   
//    [bezier closePath];
//    
//    [bezier fill];
    
//    UIBezierPath *bezier2 =[UIBezierPath bezierPathWithArcCenter:CGPointMake(50, 50) radius:20 startAngle:0 endAngle:M_PI clockwise:YES];
//    
//    CAShapeLayer *layer =[CAShapeLayer layer];
//    layer.path=bezier2.CGPath;
//    layer.strokeColor=[UIColor redColor].CGColor;
//    layer.fillColor=[UIColor blueColor].CGColor;
//    layer.borderWidth=1;
//    
//    
//    [self.layer addSublayer:layer];

}

@end
