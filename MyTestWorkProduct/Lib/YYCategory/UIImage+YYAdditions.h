//
//  UIImage+YYAdditions.h
//  YY
//
//  Created by liguowei on 14-10-14.
//  Copyright (c) 2014年 itbox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YYAdditions)
/**
 *  view转化成image
 */
+(UIImage *) imageWithView:(UIView *) view;

/**
 *  返回一张自由拉伸的图片
 *
 *  @param name 图片的名字
 *
 *  @return 图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name;

/**
 *  返回一张自由拉伸的图片
 *
 *  @param name 图片的名字
 *  @param left 图片距离左边拉伸的比例
 *  @param top  图片距离顶部拉伸的比例
 *
 *  @return 图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;

/**
 *  返回一张纯颜色的图片
 *
 *  @param color 颜色
 *
 *  @return 图片
 */
+(UIImage*) imageWithColor:(UIColor*)color;

/**
 *  根据图片路径加载一张图片
 *
 *  @param name 图片名字
 *
 *  @return 图片
 */
+ (UIImage *)imageWithFile:(NSString *)name;
@end
