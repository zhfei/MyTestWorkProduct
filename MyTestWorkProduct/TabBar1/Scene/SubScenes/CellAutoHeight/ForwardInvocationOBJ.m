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

//1.
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    return NO;
}
//2.
- (id)forwardingTargetForSelector:(SEL)aSelector {
    return nil;
}
//3.
//最后一步，返回方法签名
////询问此选择器是否是有效的
//-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
//    NSLog(@"methodSignatureForSelector");
//    if ([NSStringFromSelector(aSelector) isEqualToString:@"showSelf"]) {
//        return [[SubObject new] methodSignatureForSelector:aSelector];
//    }
//    return [super methodSignatureForSelector:aSelector];
//}
////处理消息
//-(void)forwardInvocation:(NSInvocation *)anInvocation{
//    NSLog(@"forwardInvocation");
//    if ([NSStringFromSelector(anInvocation.selector) isEqualToString:@"showSelf"]) {
//        [anInvocation invokeWithTarget:[SubObject new]];
//    }else{
//        [super forwardInvocation:anInvocation];
//    }
//}


@end
