//
//  StAVPlayer.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/9.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "StAVPlayer.h"
#import "AVPlayerProtocol.h"
#import "AVPlayer.h"

@interface StAVPlayer()
{

    id<AVPlayerProtocol> avPlayer;
}

@end

@implementation StAVPlayer

- (instancetype)init
{
    self = [super init];
    if (self) {
        avPlayer = [AVPlayer new];
    }
    return self;
}

- (NSString *)st_play {

    return [avPlayer a_play];
}

- (NSString *)st_pause {
    
    return [avPlayer a_pause];
}

- (NSString *)st_stop {
    
    return [avPlayer a_stop];
}


@end
