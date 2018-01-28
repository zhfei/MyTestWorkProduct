//
//  ImageCachePool.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/2.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageCachePool : NSObject
/*!**创建单例***/
+ (ImageCachePool *)sharedImageCachePool;
/*!**销毁单例***/
+ (void)destroyInstance ;

/*!
 *  @author zhoufei
 *
 *  @brief 图片缓存池
 *  @param name 图片名
 *  @param bundleName 包名
 *  @return 图片实例
 */
- (UIImage *)imageNamed:(NSString *)name fromBundle:(NSString *)bundleName;

/*!
 *  @author zhoufei
 *
 *  @brief 销毁一个bundle的图片缓存池
 *  @param bundleName 包名
 */
- (void)destroyImageCacheWithBundleNamed:(NSString *)bundleName;


@end
