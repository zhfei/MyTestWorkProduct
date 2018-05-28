//
//  PizzleView.m
//  ImageClipe
//
//  Created by 周飞 on 2018/5/28.
//  Copyright © 2018年 周飞. All rights reserved.
//

#import "PizzleView.h"

@implementation PizzleView
+ (instancetype)pizzleView {
    PizzleView *pizzleView = [[NSBundle mainBundle] loadNibNamed:@"PizzleView" owner:nil options:nil][0];
    return pizzleView;
}

- (void)setupView {
    CGRect bounds = self.imageView.bounds;
    
    CGFloat width = 50;
    CGFloat heigh = bounds.size.height;
    
    CGFloat x1 = 20;
    CGFloat x2 = bounds.size.width - width - 20;
    
    CGRect frame1 = CGRectMake(x1, 0, width, heigh);
    CGRect frame2 = CGRectMake(x2, 0, width, heigh);
    
    UIImageView *imageV1 = [UIImageView new];
    [imageV1 setFrame:frame1];
    [self.imageView addSubview:imageV1];
    
    //   创建一个路径对象
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    //  起点
    [linePath moveToPoint:(CGPoint){5,20}];
    // 其他点
    [linePath addLineToPoint:(CGPoint){30,80}];
    [linePath addLineToPoint:(CGPoint){50,20}];
    
    //  设置路径画布
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.bounds = (CGRect){0,0,width,heigh};
    lineLayer.position = imageV1.center;
    lineLayer.lineWidth = 2.0;
    lineLayer.strokeColor = [UIColor orangeColor].CGColor; //   边线颜色
    
    lineLayer.path = linePath.CGPath;
    lineLayer.fillColor  = nil;   //  默认是black
    [imageV1.layer addSublayer:lineLayer];
    

    
    
    
    UIView *view2 = [UIView new];
    [view2 setFrame:frame2];
    
//    [imageV1 setImage:[self clicpViewWithRect:frame2]];
    UIImage *image = [self clicpViewWithRect:frame2];
    imageV1.layer.contents = image;

}

-(UIImage *)clicpViewWithRect:(CGRect)aRect //arect 想要截图的区域
{
    CGFloat width = self.imageView.bounds.size.width;
    CGFloat heigh = self.imageView.bounds.size.height;
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(width, heigh), YES, 1);
    
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    CGImageRef imageRef = viewImage.CGImage;
    
    CGImageRef imageRefRect =CGImageCreateWithImageInRect(imageRef, aRect);
    
    UIImage *sendImage = [[UIImage alloc] initWithCGImage:imageRefRect];
    
    return sendImage;
    
}

@end
