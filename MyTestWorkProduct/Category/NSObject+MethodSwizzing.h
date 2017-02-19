//
//  NSObject+MethodSwizzing.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/6/1.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (MethodSwizzing)
/**
 *  替换类的方法
 *
 *  @param class            需要被替换的类
 *  @param originalSelector 需要被替换的函数
 *  @param swizzedClass     替换使用的类
 *  @param swizzledSelector 替换时使用的函数
 *
 *  @return 替换是否成功
 */
+ (BOOL)zh_swizzleClass:(Class) class original:(SEL)originalSelector withSwizzedClass:(Class)swizzedClass swizzledSelector:(SEL)swizzledSelector;

/**
 *  替换类的元类的方法
 *
 *  @param class            需要被替换的类
 *  @param originalSelector 需要被替换的函数
 *  @param swizzedClass     替换使用的类
 *  @param swizzledSelector 替换时使用的函数
 *
 *  @return 替换是否成功
 */
+ (BOOL)zh_swizzleMetaClass:(Class) class original:(SEL)originalSelector withSwizzedClass:(Class)swizzedClass swizzledSelector:(SEL)swizzledSelector;

/**
 *  替换类的方法
 *
 *  @param originalSelector 需要被替换的函数
 *  @param swizzedClass     替换使用的类
 *  @param swizzledSelector 替换时使用的函数
 *
 *  @return 替换是否成功
 */
+ (BOOL)zh_swizzleSelector:(SEL)originalSelector withSwizzedClass:(Class)swizzedClass swizzledSelector:(SEL)swizzledSelector;

@end
