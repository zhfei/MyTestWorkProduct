//
//  LocalNotificationService.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2018/1/31.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

#import "LocalNotificationService.h"

@implementation LocalNotificationService

+ (void)addLocalNotification:(NSDate *)fireDate alertTitle:(NSString *)alertTitle alertBody:(NSString *)alertBody alertAction:(NSString *)alertAction {
    
    UILocalNotification *localNot = [self localNotification:fireDate alertTitle:alertTitle alertBody:alertBody alertAction:alertAction];
    localNot.userInfo = @{@"type":@"LocalNotification"};
    [[UIApplication sharedApplication] scheduleLocalNotification:localNot];
}

//+ (void)addLocalNotification {
//
//    UILocalNotification *localNote = [[UILocalNotification alloc] init];
//    localNote.fireDate = [NSDate dateWithTimeIntervalSinceNow:3.0];
//    localNote.alertBody = @"刷新查看最新的营销活动信息！！";
//
//    localNote.alertAction = @"查看最新营销活动"; // 锁屏状态下显示: 滑动来快点啊
//    localNote.alertTitle = @"营销活动更新";
//
//    NSInteger badgeNum = localNote.applicationIconBadgeNumber;
//    localNote.applicationIconBadgeNumber = badgeNum+1;
//
//    localNote.userInfo = @{@"type":@1};
//
//    // 3.调用通知
//    [[UIApplication sharedApplication] scheduleLocalNotification:localNote];
//}

+ (UILocalNotification *)localNotification:(NSDate *)fireDate alertTitle:(NSString *)alertTitle alertBody:(NSString *)alertBody alertAction:(NSString *)alertAction {
    
    UILocalNotification *localNote = [[UILocalNotification alloc] init];
    localNote.fireDate = fireDate;
    
    localNote.alertBody = alertBody;
    localNote.alertAction = alertAction; // 锁屏状态下显示: 滑动来快点啊
    localNote.alertTitle = alertTitle;
    
    localNote.soundName = UILocalNotificationDefaultSoundName;
    
    NSInteger badgeNum = localNote.applicationIconBadgeNumber;
    localNote.applicationIconBadgeNumber = badgeNum+1;
    

    return localNote;
}

@end
