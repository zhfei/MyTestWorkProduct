//
//  ImageCachePool.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/2.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "ImageCachePool.h"

static ImageCachePool *_instance=nil;

@interface ImageCachePool ()

@property (strong ,nonatomic)NSMutableDictionary * imageCachePool;
@end

@implementation ImageCachePool

+ (instancetype)sharedImageCachePool {
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _instance=[[self alloc] init];
        
        NSLog(@"%@:----创建了",NSStringFromSelector(_cmd));
    });
    return _instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

+ (void)destroyInstance {
    
    _instance=nil;
}

- (id)copyWithZone:(NSZone *)zone
{
    return _instance;
}

- (void)dealloc {
    NSLog(@"%@:----释放了",NSStringFromSelector(_cmd));
}

-(NSMutableDictionary *)imageCachePool {

    if (!_imageCachePool) {
        _imageCachePool = @{}.mutableCopy;
    }
    return _imageCachePool;
}

#pragma mark -- 接口方法

/*!
 *  @author zhoufei
 *
 *  @brief 图片缓存池
 *  @param name 图片名
 *  @param bundleName 包名
 *  @return 图片实例
 */
- (UIImage *)imageNamed:(NSString *)name fromBundle:(NSString *)bundleName {
    
    UIImage * cacheImage = [self cacheImage:name fromBundle:bundleName];
    if (cacheImage) {
        return cacheImage;
    } else {
        
        [self additionalImageName:name fromBundle:bundleName];
        UIImage * additionalImage = [self cacheImage:name fromBundle:bundleName];
        return additionalImage;
    }
}

/*!
 *  @author zhoufei
 *
 *  @brief 销毁一个bundle的图片缓存池
 *  @param bundleName 包名
 */
- (void)destroyImageCacheWithBundleNamed:(NSString *)bundleName {

    if (!bundleName) {
        NSLog(@"包名不能为空！");
        return;
    }
    
    [self.imageCachePool removeObjectForKey:bundleName];
}

#pragma mark -- 非接口方法

/**
 *  获取缓存图片对象
 *
 *  @param name 图片名
 *  @return 图片实例
 */
- (UIImage *)cacheImage:(NSString *)name fromBundle:(NSString *)bundleName {
    
    if (!bundleName || !name) {
        return nil;
    }
    
    NSMutableDictionary * bundleImageCachePool = [self.imageCachePool objectForKey:bundleName];
    if (!bundleImageCachePool) {
        return nil;
    }
    
    UIImage * image = [bundleImageCachePool objectForKey:name];
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
    
    [self setImage:tempImage name:name fromBundle:bundleName];
}

#pragma mark -- Set
- (void)setImage:(UIImage *)image name:(NSString *)name fromBundle:(NSString *)bundleName {
    
    if (!image || !name || !bundleName) {
        NSLog(@"图片缓存对象 或者 图片缓存名为空！图片对象:%@ /\n 图片名称:%@ /\n bundle名称:%@",image.description,name,bundleName);
        return;
    }
    
    NSMutableDictionary * bundleImageCachePool = [self.imageCachePool objectForKey:bundleName];
    if (!bundleImageCachePool) {
        bundleImageCachePool = @{}.mutableCopy;
        [self.imageCachePool setObject:bundleImageCachePool forKey:bundleName];
    }
    
    [bundleImageCachePool setObject:image forKey:name];
}

#pragma mark -- 工具方法
NSBundle * externBundle(NSString *bundleName){
    
    NSBundle *bundle = nil;
    
    NSString *bundeFullName;
    if ([bundleName rangeOfString:@".bundle"].location == NSNotFound) {
        bundeFullName = [NSString stringWithFormat:@"%@.bundle",bundleName];
    }else{
        bundeFullName = bundleName;
    }
    NSString *bundlePath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:bundeFullName];
    bundle = [NSBundle bundleWithPath:bundlePath];

    return bundle;
}

BOOL isStringWithAnyText(NSString * stringObj) {
    return [stringObj isKindOfClass:[NSString class]] && [stringObj length] > 0;
}

@end
