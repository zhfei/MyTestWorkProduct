//
//  NSDate+IntervalSeconds.h
//  Coffee
//
//  Created by zhoufei on 16/3/1.
//  Copyright © 2016年 XPay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (IntervalSeconds)

@property (nonatomic, readonly) NSInteger	year;
@property (nonatomic, readonly) NSInteger	month;
@property (nonatomic, readonly) NSInteger	day;
@property (nonatomic, readonly) NSInteger	hour;
@property (nonatomic, readonly) NSInteger	minute;
@property (nonatomic, readonly) NSInteger	second;
@property (nonatomic, readonly) NSInteger	weekday;

//两个时间间隔秒数
+ (NSInteger)intervalSecondsWithSmallDate:(NSDate*)smallDate bigDate:(NSDate*)bigDate;

//将yyyy-MM-dd HH:mm:ss格式时间转换成时间戳
+(NSInteger)changeTimeStringToTimeSp:(NSString *)timeStr;


//将时间戳转换成yyyy-MM-dd HH:mm:ss格式时间
+(NSString *)changeTimeSpToTimeString:(NSString*)timeSp;

//时间戳
+ (long long)timeStamp;
//时间间隔标语
- (NSString *)timeAgo;
//默认样式的时间字符串
+(NSString *)defaultFormatterDate;
//距离现在有多长时间
- (NSString *)timeLeft;


@end
