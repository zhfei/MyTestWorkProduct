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
#define DLOGCALL DLOG(@"[%@ %@]", NSStringFromClass([self class]), NSStringFromSelector(_cmd))

#define XLog_DEBUG(format, ...)    NSLog(@"[DEBUG] {%s,%d} " format, __FUNCTION__, __LINE__, ##__VA_ARGS__)
#define XLog_INFO(format, ...)     NSLog(@"[INFO] {%s,%d} " format, __FUNCTION__, __LINE__,##__VA_ARGS__)
#define XLog_ERROR(format, ...)    NSLog(@"[ERROR] {%s,%d} " format, __FUNCTION__, __LINE__, ##__VA_ARGS__)
#define XLog_WARNING(format, ...)  NSLog(@"[WARNING] {%s,%d} " format, __FUNCTION__, __LINE__, ##__VA_ARGS__)

#define SYSTEM_INFO_LOG   //include memory and cpu

#else

#define DLOG(...) /* */
#define DLOGEXT(...) /* */
#define DLOGCALL /* */

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
#define ScreenHight ([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0?[UIScreen mainScreen].bounds.size.height:[UIScreen mainScreen].bounds.size.height-70)
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define tableViewOrigin ([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0?64:0)


#define kRootDocumentsPath  [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/"]

#define kRootLibraryPath    [NSHomeDirectory() stringByAppendingPathComponent:@"Library/"]

#define kRootCachePath      [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches/"]

//主题颜色  #0075c2
#define COLOR_THEME                 [UIColor colorWithRed:36/255.0f green:166/255.0f blue:250/255.0f alpha:1.0]

//背景颜色
#define COLOR_BACKGROUND            [UIColor colorWithWhite:0.941 alpha:1.000]

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define RGB(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(1)]

//数值
#define NAV_HEIGHT                  64    //navgation height
#define TAB_TOP_HEIGHT              40     //头部 tab高
#define TAB_BOTTOM_HEIHT            49      //底部 tab 高

#endif /* Header_h */
