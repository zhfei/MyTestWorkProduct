//
//  StPlayerProtocol.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/9.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol StPlayerProtocol <NSObject>
/**
 *  策略模式播放协议--开启视频
 *
 *  @return 描述（只为举例需要）
 */
- (NSString *)st_play;

/**
 *  策略模式播放协议--暂停视频
 *
 *  @return 描述（只为举例需要）
 */
- (NSString *)st_pause; // 开启视频

/**
 *  策略模式播放协议--停止播放
 *
 *  @return 描述（只为举例需要）
 */
- (NSString *)st_stop; // 开启视频

@end
