//
//  NewPlayerProtocol.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/8.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NewPlayerProtocol <NSObject>
/**
 *  AVPlayer开启视频
 *
 *  @return 描述（只为举例需要）
 */
- (NSString *)n_play;

/**
 *  AVPlayer暂停视频
 *
 *  @return 描述（只为举例需要）
 */
- (NSString *)n_pause; // 开启视频

/**
 *  AVPlayer停止播放
 *
 *  @return 描述（只为举例需要）
 */
- (NSString *)n_stop; // 开启视频

@end
