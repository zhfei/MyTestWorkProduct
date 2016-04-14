//
//  NSObject+RunTime.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/4/13.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (RunTime)
/**
 *  获得对象所有的属性名
 *
 *  @return 返回对象所有的属性名的数组
 */
- (NSArray*)getObjectAllPropertyName;
/**
 *  获得对象所有的方法名
 *
 *  @return 获得对象所有的方法名的数组
 */
- (NSArray*)getObjectAllMethodName;
/**
 *  获得对象所有遵守协议的名
 *
 *  @return 返回对象所有遵守协议的名的数组
 */
- (NSArray*)getObjectAllAgreeProtocolName;

@end
