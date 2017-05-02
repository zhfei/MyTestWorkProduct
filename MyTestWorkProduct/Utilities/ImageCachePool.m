//
//  ImageCachePool.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/2.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "ImageCachePool.h"
#import <objc/runtime.h>


@interface ImageCachePool ()

@property (strong ,nonatomic)NSMutableDictionary * imageCachePoolDict;
@end

@implementation ImageCachePool

+ (ImageCachePool *)imageCachePool {

    ImageCachePool * imageCachePool = [ImageCachePool new];
    imageCachePool.imageCachePoolDict = @{}.mutableCopy;
    
    return imageCachePool;
}

/*!
 *  @author zhoufei
 *
 *  @brief 图片缓存池
 *  @param name 图片名
 *  @param bundleName 包名
 *  @return 图片实例
 */
- (UIImage *)imageNamed:(NSString *)name fromBundle:(NSString *)bundleName {
    
    UIImage * cacheImage = [self cacheImage:name];
    if (cacheImage) {
        return cacheImage;
    } else {
        
        [self additionalImageName:name fromBundle:bundleName];
        UIImage * additionalImage = [self cacheImage:name];
        return additionalImage;
    }
}


/**
 *  获取缓存图片对象
 *
 *  @param name 图片名
 *  @return 图片实例
 */
- (UIImage *)cacheImage:(NSString *)name {

    UIImage * image = [self.imageCachePoolDict objectForKey:name];
    return image;
}

/**
 *  往缓存池追加图片
 *
 *  @param name       图片名
 *  @param bundleName 包名
 */
- (void)additionalImageName:(NSString *)name fromBundle:(NSString *)bundleName {
    
    NSBundle *bundle = externBundle(bundleName);
    UIImage * tempImage = nil;
    if (!bundle) {
        tempImage = [UIImage imageNamed:name];
    }else{
        tempImage = [UIImage imageNamed:name inBundle:bundle compatibleWithTraitCollection:nil];
    }
    [self setImage:tempImage name:name];
}

#pragma mark -- Get、Set
- (void)setImage:(UIImage *)image name:(NSString *)name {
    
    if (!image || !name) {
        NSLog(@"图片缓存对象 或者 图片缓存名为空！图片对象:%@ /\n 图片名称:%@",image.description,name);
        return;
    }
    [self.imageCachePoolDict setObject:image forKey:name];
}

#pragma mark -- 工具方法
NSBundle * externBundle(NSString *bundleName){
    
    NSBundle *bundle = nil;
    if (isStringWithAnyText(bundleName)) {
        NSString *bundeFullName;
        if ([bundleName rangeOfString:@".bundle"].location == NSNotFound) {
            bundeFullName = [NSString stringWithFormat:@"%@.bundle",bundleName];
        }else{
            bundeFullName = bundleName;
        }
        NSString *bundlePath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:bundeFullName];
        bundle = [NSBundle bundleWithPath:bundlePath];
    } else {
        bundle = [NSBundle mainBundle];
    }
    return bundle;
}

BOOL isStringWithAnyText(id object) {
    return [object isKindOfClass:[NSString class]] && [(NSString*)object length] > 0;
}

@end
