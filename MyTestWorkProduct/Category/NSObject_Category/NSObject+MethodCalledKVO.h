//
//  NSObject+MethodCalledKVO.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/10/17.
//  Copyright © 2017年 zhoufei. All rights reserved.
//
//  监听方法的调用，并在执行监听回调
//  参考地址：http://www.jianshu.com/p/86f6059af7a0
//  原理：首先我们可以通过performSelector或者[obj message]的形式用特定的Selector向对象发送消息，此时Runtime系统会进入消息派发的流程中，如果我们什么都不做，消息派发流程最终就会找到相应的方法实现，从而调用实现得到结果返回，若我们要监听方法的调用，则需要在消息派发的过程中动点手脚，将方法调用的事件从里面回调出来。


#import <Foundation/Foundation.h>

typedef void (^MessageDidSendCallback) (NSArray * _Nonnull);

@interface NSObject (MethodCalledKVO)

- (void)listen:(nonnull SEL)selector in:(nullable Protocol *)protocol with:(nonnull MessageDidSendCallback)callback;

@end
