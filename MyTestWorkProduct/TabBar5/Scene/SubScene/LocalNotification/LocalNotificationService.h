//
//  LocalNotificationService.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 2018/1/31.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocalNotificationService : NSObject

+ (void)addLocalNotification:(NSDate *)fireDate alertTitle:(NSString *)alertTitle alertBody:(NSString *)alertBody alertAction:(NSString *)alertAction;

@end
