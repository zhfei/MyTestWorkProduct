//
//  UIView+Image.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/3/12.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "UIView+Image.h"

@implementation UIView (Image)
//在图片上绘制文字
- (UIImage *)createTextImageWithImageText:( NSString *)imageText imageName:( NSString *)imageName textPosition:(KPosition)textPosition

{
    
    UIImage *image = [ UIImage imageNamed : imageName ];

    UIFont* myFont;
    CGFloat leftX ;
    CGSize stringSize;
    
    CGSize size; // 画布大小
    
    if (textPosition==KPositionLeft) {
        
        myFont =[UIFont systemFontOfSize:12];
        stringSize= [imageText sizeWithAttributes:@{ NSFontAttributeName :myFont, NSForegroundColorAttributeName :[ UIColor whiteColor] }];

        size= CGSizeMake(stringSize.width+16, stringSize.height+2); // 画布大小
        UIGraphicsBeginImageContextWithOptions(size, NO, 0);
        [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
        
        CGContextRef context=UIGraphicsGetCurrentContext();
        
        CGContextDrawPath (context, kCGPathStroke );
        
       
        leftX =(size.width-stringSize.width)/2-6;
        
        [@"折" drawAtPoint : CGPointMake (leftX+stringSize.width, (size.height-stringSize.height)/2+3) withAttributes : @{ NSFontAttributeName :[UIFont systemFontOfSize:9], NSForegroundColorAttributeName :[ UIColor whiteColor] } ];
            

    }else{
        
        size= CGSizeMake(80, 40); // 画布大小
        
        UIGraphicsBeginImageContext(size);
        
        [image drawInRect:CGRectMake(0, 0, 80, 40)];

        
        myFont =[UIFont systemFontOfSize:9];
        stringSize= [imageText sizeWithAttributes:@{ NSFontAttributeName :myFont, NSForegroundColorAttributeName :[ UIColor whiteColor] }];
        
        leftX =(size.width-stringSize.width)/2+1;

    }
    
    
    [imageText drawAtPoint : CGPointMake (leftX, (size.height-stringSize.height)/2 ) withAttributes : @{ NSFontAttributeName :myFont, NSForegroundColorAttributeName :[ UIColor whiteColor] } ];
    
    // 返回绘制的新图形
    
    UIImage *newImage= UIGraphicsGetImageFromCurrentImageContext ();
    
    UIGraphicsEndImageContext ();
    
    return newImage;
    
}

//全屏截图
- (UIImage *)imageFromTheView:(UIView*)view
{
    UIGraphicsBeginImageContext(view.bounds.size);
    CGContextRef context =UIGraphicsGetCurrentContext();
    
    [view.layer renderInContext:context];
    
    UIImage *lastImage= UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return lastImage;
}

//视图添加倒影效果

const CGFloat kReflectPercent = -0.3f;
const CGFloat kReflectOpacity = 0.3f;
const CGFloat kReflectDistance = 10.0f;
+ (void)addSimpleReflectionToView:(UIView *)theView {
    CALayer *reflectionLayer = [CALayer layer];
    reflectionLayer.contents = [theView layer].contents;
    reflectionLayer.opacity = kReflectOpacity;
    reflectionLayer.frame = CGRectMake(0.0f,0.0f,theView.frame.size.width,theView.frame.size.height*kReflectPercent);
    //倒影层框架设置，其中高度是原视图的百分比
    CATransform3D stransform = CATransform3DMakeScale(1.0f,-1.0f,1.0f);
    CATransform3D transform = CATransform3DTranslate(stransform,0.0f,-(kReflectDistance + theView.frame.size.height),0.0f); reflectionLayer.transform = transform;
    reflectionLayer.sublayerTransform = reflectionLayer.transform;
    [[theView layer] addSublayer:reflectionLayer];
}

+ (CGImageRef) createGradientImage:(CGSize)size {
    CGFloat colors[] = {0.0,1.0,1.0,1.0};
    //在灰色设备色彩上建立一渐变
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGContextRef context = CGBitmapContextCreate(nil,size.width,size.height,8,0,colorSpace,kCGImageAlphaNone);
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace,colors,NULL,2);
    CGColorSpaceRelease(colorSpace);
    //绘制线性渐变
    CGPoint p1 = CGPointZero;
    CGPoint p2 = CGPointMake(0,size.height);
    CGContextDrawLinearGradient(context,gradient,p1,p2,kCGGradientDrawsAfterEndLocation);
    //Return the CGImage
    CGImageRef theCGImage = CGBitmapContextCreateImage(context);
    CFRelease(gradient);
    CGContextRelease(context);
    return theCGImage;
}
 
    //Create a shrunken frame for the reflection

+ (UIImage *) reflectionOfView:(UIView *)theView WithPercent:(CGFloat) percent {
    //Retain the width but shrink the height
    CGSize size = CGSizeMake(theView.frame.size.width, theView.frame.size.height * percent);
    //Shrink the View
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [theView.layer renderInContext:context];
    UIImage *partialimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    //build the mask
    CGImageRef mask = [UIView createGradientImage:size];
    CGImageRef ref = CGImageCreateWithMask(partialimg.CGImage,mask);
    UIImage *theImage = [UIImage imageWithCGImage:ref];
    CGImageRelease(ref); CGImageRelease(mask);
    return theImage;
}


+ (void) addReflectionToView: (UIView *)theView {
    theView.clipsToBounds = NO;
    UIImageView *reflection = [[UIImageView alloc] initWithImage:[UIView reflectionOfView:theView WithPercent:0.45f]];
    CGRect frame = reflection.frame;
    frame.origin = CGPointMake(0.0f, theView.frame.size.height + kReflectDistance);
    reflection.frame = frame;
    // add the reflection as a simple subview
    [theView addSubview:reflection];
    
}

//关于图片缩放的线程安全和非线程安全操作.
//非线程安全的操作只能在主线程中进行操作,对于大图片的处理肯定会消耗大量的时间,如下面的方法
//方法 1： 使用 UIKit
+ (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    // End the context
    UIGraphicsEndImageContext();
    // Return the new image.
    return newImage;
}


@end
