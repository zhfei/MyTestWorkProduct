//
//  TestVC1.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/24.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventProtocol.h"


@interface TestVC1 : UIViewController <EventProtocol>

@property (strong,nonatomic)NSString *channelId;

+ (TestVC1 *)testVC1WithChannelId:(NSString *)channelId;

@end
