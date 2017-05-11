//
//  TpNewPlayer.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/11.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "TpNewPlayer.h"
#import "NewPlayer.h"

@interface TpNewPlayer()
@property (strong,nonatomic)id<NewPlayerProtocol>  tpNewPlayer;
@end

@implementation TpNewPlayer
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tpNewPlayer = [NewPlayer new];
    }
    return self;
}

//Player开启视频
- (NSString *)play{
    return [self.tpNewPlayer n_play];
}

//Player暂停视频
- (NSString *)pause{
    return [self.tpNewPlayer n_pause];
}

//Player停止播放
- (NSString *)stop{
    return [self.tpNewPlayer n_stop];
}

@end
