//
//  ImageLabel.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/3/14.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "ImageLabel.h"

@implementation ImageLabel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.index=0;
        [self createImageLabel];
    }
    return self;
}

- (void)createImageLabel
{
    [self setBackgroundColor:[UIColor clearColor]];
    [self setNeedsDisplay];
}


- (void)drawRect:(CGRect)rect
{
    CGContextRef content =UIGraphicsGetCurrentContext();
    
    switch (self.index) {
        case 0:
        {
            CGContextSetRGBStrokeColor(content, 0.1, 0.5, 0.6, 1);
            CGContextMoveToPoint(content, 0, 0);
            CGContextAddLineToPoint(content, rect.size.width, rect.size.height);
            CGContextStrokePath(content);
        }
            break;
        case 1:
        {
            CGContextSetLineWidth(content, 2);
            CGContextSetRGBStrokeColor(content, 0.1, 0.5, 0.6, 1);
            [@"今天是星期三，外面天空很蓝，风吹在脸上很暖和" drawInRect:CGRectMake(0, 0, rect.size.width, rect.size.height) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]}];

        }
            break;
        case 2:
        {
            CGContextSetLineWidth(content, 10);
            CGContextSetRGBStrokeColor(content, 0.2, 0.5, 0.8, 1);
            CGContextStrokeRect(content, CGRectMake(0, 0, rect.size.width, rect.size.height));
            CGContextStrokePath(content);
        }
            break;
        case 3:
        {
            CGContextSetRGBFillColor(content, 0.3, 0.4, 0.8, 1);
            CGContextFillRect(content, CGRectMake(10, 10, rect.size.width-20, rect.size.height-20));
        }
            break;
        case 4:
        {
            CGContextSetLineWidth(content, 6);
            CGContextSetRGBStrokeColor(content, 0.1, 0.2, 0.3, 1);
            CGContextAddEllipseInRect(content, CGRectMake(10, 10, rect.size.width-20, rect.size.height-60));
            CGContextStrokePath(content);
            
        }
            break;
        case 5:
        {
            CGContextSetRGBFillColor(content, 0.3, 0.4, 0.8, 1);
            CGContextFillEllipseInRect(content, CGRectMake(10, 10, rect.size.width-20, rect.size.height-60));
        }
            break;
        case 6:
        {
            CGContextSetLineWidth(content, 10);
            CGContextSetStrokeColorWithColor(content, [UIColor redColor].CGColor);
            CGContextAddRect(content, CGRectMake(10, 10, rect.size.width-20, rect.size.height-20));
            CGContextStrokePath(content);
            CGContextSetRGBFillColor(content, 0.5, 0.8, 0.7, 1);
            CGContextFillRect(content, CGRectMake(10, 10, rect.size.width-20, rect.size.height-20));
          
        }
            break;
        case 7:
        {
            CGContextSetLineWidth(content, 2);
            CGContextSetStrokeColorWithColor(content, [UIColor blueColor].CGColor);
            CGContextMoveToPoint(content, 10, 10);
            CGContextAddLineToPoint(content, 30, 10);
            CGContextAddArc(content, 10, 50, 20, 0, M_PI, 0);
            CGContextStrokePath(content);
        }
            break;
        case 8:
        {
            
        }
            break;
        case 9:
        {
            
        }
            break;
        case 10:
        {
            
        }
            break;
        case 11:
        {
            UIImage *image =[UIImage imageNamed:self.imageName];
            image =[image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
            
            CGImageRef imageRef=image.CGImage;
            
            CGContextDrawImage(content, CGRectMake(10, 10, 50, 15), imageRef);
            [@"100折" drawInRect:CGRectMake(10, 10, 30, 15) withAttributes : @{ NSFontAttributeName :[UIFont systemFontOfSize:12], NSForegroundColorAttributeName :[ UIColor whiteColor] } ];
        }
            break;
        case 12:
        {
            
        }
            break;
            
            
            
        default:
            break;
    }
    
    
    
    

    

    
    
}


@end
