//
//  ImageCachePool.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/2.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "ImageCachePool.h"
#import <objc/runtime.h>

static char * const PropertyKey = "PropertyKey";

@implementation ImageCachePool

/*!
 *  @author zhoufei
 *
 *  @brief 图片缓存池
 *  @param name 图片名
 *  @param bundleName 包名
 *  @return 图片实例
 */
+ (UIImage *)imageNamed:(NSString *)name fromBundle:(NSString *)bundleName {
    

    NSMutableDictionary * cacheDict = [self cacheImages];
    UIImage * image = [cacheDict objectForKey:name];
    
    if (image) {
        return image;
    } else {
        
        NSBundle *bundle = externBundle(bundleName);
        UIImage * tempImage = nil;
        if (!bundle) {
            tempImage = [UIImage imageNamed:name];
        }else{
            tempImage = [UIImage imageNamed:name inBundle:bundle compatibleWithTraitCollection:nil];
        }
        [self setImage:tempImage name:name];
        
        return tempImage;
    }
    
}

#pragma mark -- Get、Set
+ (void)setImage:(UIImage *)image name:(NSString *)name {
    
    if (!image || !name) {
        NSLog(@"图片缓存对象 或者 图片缓存名为空！图片对象:%@/\n 图片名称:%@",image.description,name);
        return;
    }
    
    NSMutableDictionary * cacheDict = [self cacheImages];
    if (!cacheDict) {
        cacheDict = [NSMutableDictionary dictionary];
        [self addCacheImages:cacheDict];
    }
    
    [cacheDict setObject:image forKey:name];
}

+ (NSMutableDictionary *)cacheImages {

   return objc_getAssociatedObject(self, &PropertyKey);
}
+ (void)addCacheImages:(NSDictionary *)cacheImages {

    objc_setAssociatedObject(self, &PropertyKey, cacheImages, OBJC_ASSOCIATION_RETAIN);
}

#pragma mark -- 工具方法

NSBundle* externBundle(NSString *bundleName){
    assert(isStringWithAnyText(bundleName));
    NSString *bundeFullName;
    if ([bundleName rangeOfString:@".bundle"].location == NSNotFound) {
        bundeFullName = [NSString stringWithFormat:@"%@.bundle",bundleName];
    }else{
        bundeFullName = bundleName;
    }
    NSString *bundlePath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:bundeFullName];
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
    return bundle;
}

BOOL isStringWithAnyText(id object) {
    return [object isKindOfClass:[NSString class]] && [(NSString*)object length] > 0;
}

@end
