//
//  Header.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 15/11/3.
//  Copyright © 2015年 zhoufei. All rights reserved.
//

#ifndef Header_h
#define Header_h

#ifdef DEBUG  //debug log
/**
 Logs a method call's class and selector.
 */
#define XLog_DEBUG(format, ...)    NSLog(@"[DEBUG] {%s,%d} " format, __FUNCTION__, __LINE__, ##__VA_ARGS__)
#define XLog_INFO(format, ...)     NSLog(@"[INFO] {%s,%d} " format, __FUNCTION__, __LINE__,##__VA_ARGS__)
#define XLog_ERROR(format, ...)    NSLog(@"[ERROR] {%s,%d} " format, __FUNCTION__, __LINE__, ##__VA_ARGS__)
#define XLog_WARNING(format, ...)  NSLog(@"[WARNING] {%s,%d} " format, __FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define XLog_DEBUG(format,...)
#define XLog_INFO(format,...)
#define XLog_ERROR(format,...)
#define XLog_WARNING(format,...)
#endif


#ifdef DEBUG  //debug log
#   define MyLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define MyLog(...);
#endif

#define isLargeIOS7 [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0

//支持横屏模式下
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000 // 当前Xcode支持iOS8及以上
#define ScreenWidth ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?[UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale:[UIScreen mainScreen].bounds.size.width)
#define ScreenHeigh ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?[UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale:[UIScreen mainScreen].bounds.size.height)
#define ScreenSize ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?CGSizeMake([UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale,[UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale):[UIScreen mainScreen].bounds.size)
#else
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeigh [UIScreen mainScreen].bounds.size.height
#define ScreenSize [UIScreen mainScreen].bounds.size
#endif



#define kRootDocumentsPath  [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/"]
#define kRootLibraryPath    [NSHomeDirectory() stringByAppendingPathComponent:@"Library/"]
#define kRootCachePath      [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches/"]

//主题颜色  #0075c2
#define COLOR_THEME                 [UIColor colorWithRed:36/255.0f green:166/255.0f blue:250/255.0f alpha:1.0]
//背景颜色
#define COLOR_BACKGROUND            [UIColor colorWithWhite:0.941 alpha:1.000]

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define RGB(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(1)]
//随机颜色
#define RandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

//数值
#define Weakify(type)  __weak typeof(type) weak##type = type;
#define Strongfy(type)  __strong typeof(type) type = weak##type;

#define DegreesToRadian(x) (M_PI * (x) / 180.0)
#define RadianToDegrees(radian) (radian*180.0)/(M_PI)

#endif /* Header_h */
