//
//  SingletonViewController+Sort.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/8/16.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "SingletonViewController+Sort.h"

@implementation SingletonViewController (Sort)
    
+ (void)load {
    
    NSLog(@"SingletonViewController (Sort)--%@--date:%@",NSStringFromSelector(_cmd),[NSDate date]);
}
    
+ (void)initialize {
    
    NSLog(@"SingletonViewController (Sort)--%@--date:%@",NSStringFromSelector(_cmd),[NSDate date]);
}
    
- (void)dealloc {
    
    NSLog(@"SingletonViewController (Sort)--%@--date:%@",NSStringFromSelector(_cmd),[NSDate date]);
}

@end
