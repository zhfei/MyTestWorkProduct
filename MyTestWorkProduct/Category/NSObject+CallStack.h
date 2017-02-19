//
//  NSObject+CallStack.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/6/21.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (CallStack)
/*!
 *  @author zhoufei
 *
 *  @brief 从调用栈中查询，是否是className类的，methodNames方法中的一个方法调用的
 *
 *  @param className   调用的类名
 *  @param methodNames 方法数组中的某一个方法调用
 *
 *  @return 调用的方法
 */
+(NSString *)methodNameOfCallerWithClassName:(NSString*)className methodNames:(NSArray*)methodNames;
@end
