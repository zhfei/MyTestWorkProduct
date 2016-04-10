//
//  CircleProgressView.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/3/3.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "CircleProgressView.h"


#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

@interface CircleProgressView()
@property(strong,nonatomic)CAShapeLayer *shapeLayerBlue;
@property(strong,nonatomic)CAShapeLayer *shapeLayerGray;
@end

@implementation CircleProgressView
- (void)drawRect:(CGRect)rect
{
    CGFloat width =180;
    CGFloat height =180;
    
    CGFloat progressAngle = _progress * 360.0 - 90;
    CGPoint center = CGPointMake(width / 2.0f, height / 2.0f);
    CGFloat radius = MIN(width, height) / 2.0f;
    
    CGFloat circleWidth = 20.0f;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    //左边外侧灰色圆弧
    UIBezierPath *outerCircle = [UIBezierPath bezierPathWithArcCenter:center
                                                               radius:radius
                                                           startAngle:DEGREES_TO_RADIANS(progressAngle)
                                                             endAngle:DEGREES_TO_RADIANS(270)
                                                            clockwise:YES];
    //左边灰色圆弧、上面半圆
    if (1)
    {
        CGPoint point;
        point.x = (cos(DEGREES_TO_RADIANS(-90)) * (radius - circleWidth/2)) + center.x;
        point.y = (sin(DEGREES_TO_RADIANS(-90)) * (radius - circleWidth/2)) + center.y;
        
        [outerCircle addArcWithCenter:point
                        radius:circleWidth/2
                    startAngle:DEGREES_TO_RADIANS(-90)
                      endAngle:DEGREES_TO_RADIANS(90)
                     clockwise:YES];
    }

    //左边内侧灰色圆弧
    [outerCircle addArcWithCenter:center
                           radius:radius - circleWidth
                       startAngle:DEGREES_TO_RADIANS(270)
                         endAngle:DEGREES_TO_RADIANS(progressAngle)
                        clockwise:NO];
    
    //左边灰色圆弧、下面半圆
    if (1)
    {
        CGPoint point;
        point.x = (cos(DEGREES_TO_RADIANS(progressAngle)) * (radius - circleWidth/2)) + center.x;
        point.y = (sin(DEGREES_TO_RADIANS(progressAngle)) * (radius - circleWidth/2)) + center.y;
        
        [outerCircle addArcWithCenter:point
                        radius:circleWidth/2
                    startAngle:DEGREES_TO_RADIANS(270.0 + progressAngle - 90.0)
                      endAngle:DEGREES_TO_RADIANS(progressAngle )
                     clockwise:NO];
    }
    

    outerCircle.lineWidth=0.5;
    [[UIColor lightGrayColor] setStroke];
    [outerCircle stroke];


    //右边外侧蓝色圆弧
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path appendPath:[UIBezierPath bezierPathWithArcCenter:center
                                                    radius:radius
                                                startAngle:DEGREES_TO_RADIANS(-90)
                                                  endAngle:DEGREES_TO_RADIANS(progressAngle)
                                                 clockwise:YES]];
    //右边蓝色圆弧、下面半圆
    if (1)
    {
        CGPoint point;
        point.x = (cos(DEGREES_TO_RADIANS(progressAngle)) * (radius - circleWidth/2)) + center.x;
        point.y = (sin(DEGREES_TO_RADIANS(progressAngle)) * (radius - circleWidth/2)) + center.y;
        
        [path addArcWithCenter:point
                        radius:circleWidth/2
                    startAngle:DEGREES_TO_RADIANS(progressAngle)
                      endAngle:DEGREES_TO_RADIANS(270.0 + progressAngle - 90.0)
                     clockwise:YES];
    }
    
    //右边内侧蓝色圆弧
    [path addArcWithCenter:center
                    radius:radius-circleWidth
                startAngle:DEGREES_TO_RADIANS(progressAngle)
                  endAngle:DEGREES_TO_RADIANS(-90)
                 clockwise:NO];
    
    //右边蓝色圆弧、上面半圆
    if (1)
    {
        CGPoint point;
        point.x = (cos(DEGREES_TO_RADIANS(-90)) * (radius - circleWidth/2)) + center.x;
        point.y = (sin(DEGREES_TO_RADIANS(-90)) * (radius - circleWidth/2)) + center.y;
        
        [path addArcWithCenter:point
                        radius:circleWidth/2
                    startAngle:DEGREES_TO_RADIANS(90)
                      endAngle:DEGREES_TO_RADIANS(-90)
                     clockwise:NO];
    }
    
    [path closePath];

    [[UIColor blueColor] setFill];
    [path fill];

    
    
    //中间下载进度百分百
    if (1)
    {
        NSString *progressString = [NSString stringWithFormat:@"%.2f ％", _progress * 100.0];

        UIFont *font = [UIFont systemFontOfSize:26];
  
        
        NSDictionary *attribute = @{NSFontAttributeName: font};
        CGSize expectedSize = [progressString boundingRectWithSize:CGSizeMake(200, MAXFLOAT) options: NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
        
        [[UIColor redColor] setFill];
        
        
        NSMutableParagraphStyle* paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
        NSDictionary*attribute2 = @{NSFontAttributeName:font,NSParagraphStyleAttributeName:paragraphStyle};
        
        [progressString drawWithRect:CGRectMake((width-expectedSize.width)/2, (height-expectedSize.height)/2,expectedSize.width, expectedSize.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute2 context:nil];
    }

     CGContextRestoreGState(context);
}

- (void)setProgress:(double)progress
{
    _progress = MIN(1.0, MAX(0.0, progress));
    
    [self setNeedsDisplay];
}

@end
