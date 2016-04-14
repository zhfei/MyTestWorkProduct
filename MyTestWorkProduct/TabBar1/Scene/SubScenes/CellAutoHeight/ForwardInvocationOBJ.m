//
//  ForwardInvocationOBJ.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/4/13.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "ForwardInvocationOBJ.h"

@implementation ForwardInvocationOBJ

/**
 *  消息转发方法覆盖
 *
 *  @param anInvocation 消息接收的对象没有那个方法，会进入决议和消息转发方法，如果两者都没有实现会crash
 */
- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    SEL aselector =[anInvocation selector];
    
    if ([@"" respondsToSelector:@selector(aselector)]) {
        [anInvocation invokeWithTarget:@""];
    }
}
/**
 *  方法签名方法覆盖
 *
 *  @param aSelector 方法
 *
 *  @return 方法签名
 */
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSMethodSignature *first =[@"" methodSignatureForSelector:@selector(aSelector)];
    if (first) {
        return first;
    }
    
    return nil;
}

- (BOOL)respondsToSelector:(SEL)aSelector
{
    if ([@"" respondsToSelector:@selector(aSelector)]) {
        return YES;
    }
    
    return NO;
}


@end
