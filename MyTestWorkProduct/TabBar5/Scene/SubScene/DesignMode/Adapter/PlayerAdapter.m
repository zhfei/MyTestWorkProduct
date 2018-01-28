//
//  PlayerAdapter.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/8.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "PlayerAdapter.h"

@interface PlayerAdapter ()
{

    NewPlayer * __newPlayer;
}
@end

@implementation PlayerAdapter
- (instancetype)initWithNewPlayer:(NewPlayer *)newPlayer {

    self = [super init];
    if (self) {
        __newPlayer = newPlayer;
    }
    
    return self;
}

- (NSString *)a_play {
    
    return __newPlayer.n_play;
}

- (NSString *)a_pause {
    
    return __newPlayer.n_pause;
}

- (NSString *)a_stop {
    
    return __newPlayer.n_stop;
}




@end
