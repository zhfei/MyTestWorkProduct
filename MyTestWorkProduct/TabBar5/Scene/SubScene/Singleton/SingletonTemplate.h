//
//  SingletonTemplate.h
//  MyTestWorkProduct
//
//  Created by xuyefeng on 17/2/19.
//  Copyright © 2017年 zhoufei. All rights reserved.
//
//  安全单例模型

#import <Foundation/Foundation.h>

@interface SingletonTemplate : NSObject

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
- (instancetype)new UNAVAILABLE_ATTRIBUTE ;

/*!**生成单例***/
+ (instancetype)sharedSingletonTemplate;
/*!**销毁单例***/
+ (void)destroyInstance;
@end
