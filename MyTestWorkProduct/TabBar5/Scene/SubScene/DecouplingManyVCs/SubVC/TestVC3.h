//
//  TestVC3.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/24.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventProtocol.h"


@interface TestVC3 : UIViewController<EventProtocol>
@property (strong,nonatomic)NSString *channelId;

+ (TestVC3 *)testVC3WithChannelId:(NSString *)channelId;
@end
