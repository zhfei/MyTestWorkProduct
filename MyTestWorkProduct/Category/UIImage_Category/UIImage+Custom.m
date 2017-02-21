//
//  UIImage+Custom.m
//  NeuTabBar
//
//  Created by _Finder丶Tiwk on 14/11/6.
//  Copyright (c) 2014年 _Finder丶Tiwk. All rights reserved.
//

#import "UIImage+Custom.h"

@implementation UIImage (Custom)


+ (UIImage *)resizedImageWithName:(NSString *)name{
    return [self resizedImageWithName:name leftRatio:0.5 topRatio:0.5];
}


+ (UIImage *)resizedImageWithName:(NSString *)name leftRatio:(CGFloat)left topRatio:(CGFloat)top{
    UIImage *image=[UIImage imageNamed:name];
    
    NSAssert(left>0&&left<1, @"leftRatio 必须是 0~1之间的小数");
    NSAssert(top>0&&top<1, @"topRatio 必须是 0~1之间的小数");
    
    return [image stretchableImageWithLeftCapWidth:image.size.width * left topCapHeight:image.size.height * top];
}


+(UIImage *)resizedImageWithImage:(UIImage *)img leftRatio:(CGFloat)left topRatio:(CGFloat)top{
    return [img stretchableImageWithLeftCapWidth:img.size.width * left topCapHeight:img.size.height * top];
}


+(UIImage *)resizedImageWithImage:(UIImage *)img{
    return [img stretchableImageWithLeftCapWidth:0.5 topCapHeight:0.5];
}


+(UIImage *)clipFromImage:(UIImage *)image inRect:(CGRect)rect{
    CGImageRef newImageRef = CGImageCreateWithImageInRect(image.CGImage, rect);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
    CGImageRelease(newImageRef);
    return newImage;;
}



+(UIImage *)screenshotWithView:(UIView *)aview{
    UIGraphicsBeginImageContext(aview.bounds.size);
    [aview.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return  screenshot;
}



@end
