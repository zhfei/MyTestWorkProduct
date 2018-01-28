//
//  UIResponder+Chain.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 2018/1/15.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (Chain)

- (void)routerEventWithEventName:(NSString *)eventName userInfo:(NSDictionary *)userInfo;

@end
