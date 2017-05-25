//
//  EventProtocol.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/24.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol EventProtocol <NSObject>
/**
 校验传入得参数
 
 @param parametes 参数
 */
+ (BOOL)eventCheckParametesAvaliable:(id)parametes;


/**
 根据参数生成一个实例
 
 @param parametes 参数
 @return 实例
 */
+ (id)eventNewObjectWithParametes:(id)parametes;

@end
