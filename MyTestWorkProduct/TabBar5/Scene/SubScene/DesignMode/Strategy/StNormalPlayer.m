//
//  StNormalPlayer.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/10.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "StNormalPlayer.h"
#import "StAVPlayer.h"
#import "StNewPlayer.h"

@interface StNormalPlayer()
{

    id<StPlayerProtocol> player;
}
@end

@implementation StNormalPlayer

- (instancetype)initWithPlayerType:(PlayerType)playerType {

    if (playerType == PlayerType_AVPlayer) {
        player = [StAVPlayer new];
    } else if (playerType == PlayerType_NewPlayer) {
        player = [StNewPlayer new];
    }
    
    return player;
}

/**
 *  开启视频
 *
 *  @return 描述（只为举例需要）
 */
- (NSString *)play {

    return [player st_play];
}

/**
 *  暂停视频
 *
 *  @return 描述（只为举例需要）
 */
- (NSString *)pause {

    return [player st_pause];
}

/**
 *  停止播放
 *
 *  @return 描述（只为举例需要）
 */
- (NSString *)stop {

    return [player st_stop];
}


@end
