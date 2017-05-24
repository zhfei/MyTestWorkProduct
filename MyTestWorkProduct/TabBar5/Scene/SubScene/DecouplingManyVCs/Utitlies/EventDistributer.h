//
//  EventDistributer.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/24.
//  Copyright © 2017年 zhoufei. All rights reserved.
//
//  事件分发器

#import <Foundation/Foundation.h>

@interface EventDistributer : NSObject

/*!
 *  @author zhoufei
 *
 *  @brief 跳转到AppStore去好评
 *  @param appId        appId
 *  @param dismissBlock 退出后的block
 */
+ (void)presentAppStoreByAppId:(NSString*)appId dismissAction:(void(^)(BOOL success, NSString *errorMsg))dismissBlock;

/*!
 *  @author zhoufei
 *
 *  @brief 发送一个事件
 *  @param className 事件接收对象，控制器类名
 *  @param parametes 参数
 *  @return 结果
 */
+ (BOOL)sendViewControllerEvent:(NSString *)className parametes:(id)parametes;

@end
