//
//  UIImage+Custom.h
//
//  Created by _Finder丶Tiwk on 14/11/6.
//  Copyright (c) 2014年 _Finder丶Tiwk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Custom)


/*!
@author _Finder丶Tiwk, 14-12-22 11:12:41

@brief  返回一个从图片中点开始自由拉伸的图片
@param name 图片名称
@return UIImage
@since 1.0
*/
+ (UIImage *)resizedImageWithName:(NSString *)name;

/*!
 @author _Finder丶Tiwk, 14-12-22 11:12:04
 
 @brief  返回一个从图片中点开始自由拉伸的图片
 @param name 图片名称
 @param left 开始拉伸位置的点距离图片左边的距离
 @param top  开始拉伸位置的点距离图片上边的距离
 @return UIImage
 @since 1.0
 */
+ (UIImage *)resizedImageWithName:(NSString *)name leftRatio:(CGFloat)left topRatio:(CGFloat)top;


/*!
 @author _Finder丶Tiwk, 14-12-22 11:12:28
 
 @brief  返回一个从图片中点开始自由拉伸的图片
 @param img  原始的图片
 @param left 开始拉伸位置的点距离图片左边的距离
 @param top  开始拉伸位置的点距离图片上边的距离
 @return UIImage
 @since 1.0
 */
+(UIImage *)resizedImageWithImage:(UIImage *)img leftRatio:(CGFloat)left topRatio:(CGFloat)top;


/*!
 @author _Finder丶Tiwk, 14-12-22 11:12:49
 
 @brief  返回一个从图片中点开始自由拉伸的图片
 @param img 原始的图片
 @return UIImage
 @since 1.0
 */
+(UIImage *)resizedImageWithImage:(UIImage *)img;





/*!
 @author _Finder丶Tiwk, 14-12-22 11:12:09
 
 @brief  从图片中按指定的位置大小截取图片的一部分
 @param image 原始的图片
 @param rect  要截取的区域
 @return UIImage
 @since 1.0
 */
+(UIImage *)clipFromImage:(UIImage *)image inRect:(CGRect)rect;

+(UIImage *)screenshotWithView:(UIView *)aview;

@end
