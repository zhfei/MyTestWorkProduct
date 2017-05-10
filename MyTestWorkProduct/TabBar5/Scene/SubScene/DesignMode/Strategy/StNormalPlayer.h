//
//  StNormalPlayer.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/10.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StPlayerProtocol.h"

// 播放器的类型
typedef enum : NSUInteger {
    PlayerType_AVPlayer,
    PlayerType_NewPlayer
} PlayerType;


@interface StNormalPlayer : NSObject <StPlayerProtocol>

- (instancetype)initWithPlayerType:(PlayerType)playerType;

/**
 *  开启视频
 *
 *  @return 描述（只为举例需要）
 */
- (NSString *)play;

/**
 *  暂停视频
 *
 *  @return 描述（只为举例需要）
 */
- (NSString *)pause;

/**
 *  停止播放
 *
 *  @return 描述（只为举例需要）
 */
- (NSString *)stop;


@end
