//
//  UIImage+MaskImage.m
//  XPay
//
//  Created by jack zhou on 1/19/15.
//  Copyright (c) 2014 jack zhou. All rights reserved.
//

#import "UIImage+MaskImage.h"

@implementation UIImage (MaskImage)
+(UIImage*)imageWithSize:(CGSize)imageSize
               tintColor:(UIColor*)tintColor
            cornerRadius:(CGFloat)radius
{
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    [tintColor setFill];
    CGRect rectImage =
    CGRectMake(0, 0, imageSize.width, imageSize.height);
    UIBezierPath * rectPath =
    [UIBezierPath bezierPathWithRect:rectImage];
    [rectPath fill];

    UIBezierPath * bezierPath =
    [UIBezierPath bezierPathWithRoundedRect:rectImage
                               cornerRadius:radius];
    [bezierPath fillWithBlendMode:kCGBlendModeClear
                            alpha:1.0];
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

-(UIImage*)imageWithTintColor:(UIColor*)tintColor
                 cornerRadius:(CGFloat)radius
{
    UIImage * coverImage = [UIImage imageWithSize:self.size
                                        tintColor:tintColor
                                     cornerRadius:radius];
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    [self drawAtPoint:CGPointZero];
    [coverImage drawAtPoint:CGPointZero];
    UIImage * imageComposed = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imageComposed;
}
//在图片上绘制文字
+ (UIImage *)createTextImageWithImageText:( NSString *)imageText imageName:( NSString *)imageName textPosition:(KPosition)textPosition

{
    
    UIImage *image = [ UIImage imageNamed : imageName ];
    UIFont* myFont;
    CGFloat leftX ;
    CGFloat leftY ;
    CGSize stringSize;
    CGSize size; // 画布大小
    
    if (textPosition==KPositionLeft) {
    
        myFont =[UIFont systemFontOfSize:11];
        stringSize= [imageText sizeWithAttributes:@{ NSFontAttributeName :myFont, NSForegroundColorAttributeName :[ UIColor whiteColor] }];
        
        size= CGSizeMake(stringSize.width+16, stringSize.height+2); // 画布大小
        
        UIGraphicsBeginImageContextWithOptions (size, NO , 0.0 );
        
        [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
        
        // 获得一个位图图形上下文
        
        CGContextRef context= UIGraphicsGetCurrentContext ();
        CGContextDrawPath (context, kCGPathStroke );
    
       leftX =(size.width-stringSize.width)/2-6;
        leftY =(size.height-stringSize.height)/2;
  
        
       [@"折" drawAtPoint : CGPointMake (leftX+stringSize.width+1, (size.height-stringSize.height)/2+3) withAttributes : @{ NSFontAttributeName :[UIFont systemFontOfSize:8], NSForegroundColorAttributeName :[ UIColor whiteColor] } ];
        
    }else{
        
        CGSize size= CGSizeMake (image.size.width , image.size.height ); // 画布大小
        
        UIGraphicsBeginImageContextWithOptions (size, NO , 0.0 );
        
        [image drawAtPoint : CGPointMake ( 0 , 0 )];
        
        // 获得一个位图图形上下文
        
        CGContextRef context= UIGraphicsGetCurrentContext ();
        CGContextDrawPath (context, kCGPathStroke );

        
        myFont =[UIFont systemFontOfSize:9];
        stringSize= [imageText sizeWithAttributes:@{ NSFontAttributeName :myFont, NSForegroundColorAttributeName :[ UIColor whiteColor] }];
        
        leftX =(size.width-stringSize.width)/2+1;
        leftY =(size.height-stringSize.height)/2;
    }
    
    [imageText drawAtPoint : CGPointMake (leftX, leftY ) withAttributes : @{ NSFontAttributeName :myFont, NSForegroundColorAttributeName :[ UIColor whiteColor] } ];
    
    // 返回绘制的新图形
    
    UIImage *newImage= UIGraphicsGetImageFromCurrentImageContext ();
    
    UIGraphicsEndImageContext ();
    
    return newImage;
    
}

@end

