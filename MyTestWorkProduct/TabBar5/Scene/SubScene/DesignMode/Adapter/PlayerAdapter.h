//
//  PlayerAdapter.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/8.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AVPlayerProtocol.h"
#import "NewPlayer.h"

@interface PlayerAdapter : NSObject <AVPlayerProtocol>

- (instancetype)initWithNewPlayer:(NewPlayer *)newPlayer;

@end
