//
//  StNewPlayer.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/9.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "StNewPlayer.h"
#import "NewPlayerProtocol.h"
#import "NewPlayer.h"

@interface StNewPlayer()
{

    id<NewPlayerProtocol> newPlayer;
}
@end

@implementation StNewPlayer

- (instancetype)init
{
    self = [super init];
    if (self) {
        newPlayer = [NewPlayer new];
    }
    return self;
}

- (NSString *)st_play {
    
    return [newPlayer n_play];
}

- (NSString *)st_pause {
    
    return [newPlayer n_pause];
}

- (NSString *)st_stop {
    
    return [newPlayer n_stop];
}

@end
