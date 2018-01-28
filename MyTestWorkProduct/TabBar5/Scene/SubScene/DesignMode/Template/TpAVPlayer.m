//
//  TpAVPlayer.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/11.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "TpAVPlayer.h"
#import "AVPlayer.h"

@interface TpAVPlayer()
@property (strong,nonatomic)id<AVPlayerProtocol> avPlayer;
@end

@implementation TpAVPlayer
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.avPlayer = [AVPlayer new];
    }
    return self;
}

//Player开启视频
- (NSString *)play{
    return [self.avPlayer a_play];
}

//Player暂停视频
- (NSString *)pause{
    return [self.avPlayer a_pause];
}

//Player停止播放
- (NSString *)stop{
    return [self.avPlayer a_stop];
}

@end
