//
//  UIResponder+Chain.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2018/1/15.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

#import "UIResponder+Chain.h"

@implementation UIResponder (Chain)
- (void)routerEventWithEventName:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    
    NSLog(@"eventName:%@,self:%@",eventName,self);
    
    [[self nextResponder] routerEventWithEventName:eventName userInfo:userInfo];

}

@end
