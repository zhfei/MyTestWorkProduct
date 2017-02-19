//
//  NSDate+IntervalSeconds.m
//  Coffee
//
//  Created by zhoufei on 16/3/1.
//  Copyright © 2016年 XPay. All rights reserved.
//

#import "NSDate+IntervalSeconds.h"

const NSInteger SECOND = 1;
const NSInteger MINUTE = 60 * SECOND;
const NSInteger HOUR = 60 * MINUTE;
const NSInteger DAY = 24 * HOUR;
const NSInteger MONTH = 30 * DAY;
const NSInteger YEAR = 12 * MONTH;

@implementation NSDate (IntervalSeconds)
//两个时间间隔秒数
+ (NSInteger)intervalSecondsWithSmallDate:(NSDate*)smallDate bigDate:(NSDate*)bigDate
{
    NSCalendar *calendar =[NSCalendar currentCalendar];
    
    
    unsigned int unitFlags =kCFCalendarUnitYear|kCFCalendarUnitMonth|kCFCalendarUnitDay|kCFCalendarUnitHour|kCFCalendarUnitMinute|kCFCalendarUnitSecond;
    
    NSDateComponents *dateComp= [calendar components:unitFlags fromDate:smallDate toDate:bigDate options:0];
    NSInteger second = [dateComp hour]*3600+[dateComp minute]*60+[dateComp second];
    
    return second;
    
}

//将yyyy-MM-dd HH:mm:ss格式时间转换成时间戳
+(NSInteger)changeTimeStringToTimeSp:(NSString *)timeStr
{
    NSInteger time;
    NSDateFormatter *format=[[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *fromdate=[format dateFromString:timeStr];
    time= (NSInteger)[fromdate timeIntervalSince1970];
    
    return time;
}

//将时间戳转换成yyyy-MM-dd HH:mm:ss格式时间
+(NSString *)changeTimeSpToTimeString:(NSString*)timeSp
{
    NSDate *date2=  [NSDate dateWithTimeIntervalSince1970:[timeSp doubleValue]];
    
    NSDateFormatter *format=[[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString = [format stringFromDate:date2];
    
    return dateString;
}

+(NSString *)defaultFormatterDate
{
    NSDateFormatter *format=[[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString = [format stringFromDate:[NSDate date]];
    
    return dateString;
}

+ (long long)timeStamp
{
    return (long long)[[NSDate date] timeIntervalSince1970];
}

- (NSInteger)year
{
    return [[NSCalendar currentCalendar] components:NSCalendarUnitYear
                                           fromDate:self].year;
}

- (NSInteger)month
{
    return [[NSCalendar currentCalendar] components:NSCalendarUnitMonth
                                           fromDate:self].month;
}

- (NSInteger)day
{
    return [[NSCalendar currentCalendar] components:NSCalendarUnitDay
                                           fromDate:self].day;
}

- (NSInteger)hour
{
    return [[NSCalendar currentCalendar] components:NSCalendarUnitHour
                                           fromDate:self].hour;
}

- (NSInteger)minute
{
    return [[NSCalendar currentCalendar] components:NSCalendarUnitMinute
                                           fromDate:self].minute;
}

- (NSInteger)second
{
    return [[NSCalendar currentCalendar] components:NSCalendarUnitSecond
                                           fromDate:self].second;
}

- (NSInteger)weekday
{
    return [[NSCalendar currentCalendar] components:NSCalendarUnitWeekday
                                           fromDate:self].weekday;
}


- (NSString *)timeAgo
{
    NSTimeInterval delta = [[NSDate date] timeIntervalSinceDate:self];
    
    if (delta < 1 * MINUTE)
    {
        return @"刚刚";
    }
    else if (delta < 2 * MINUTE)
    {
        return @"1分钟前";
    }
    else if (delta < 45 * MINUTE)
    {
        int minutes = floor((double)delta/MINUTE);
        return [NSString stringWithFormat:@"%d分钟前", minutes];
    }
    else if (delta < 90 * MINUTE)
    {
        return @"1小时前";
    }
    else if (delta < 24 * HOUR)
    {
        int hours = floor((double)delta/HOUR);
        return [NSString stringWithFormat:@"%d小时前", hours];
    }
    else if (delta < 48 * HOUR)
    {
        return @"昨天";
    }
    else if (delta < 30 * DAY)
    {
        int days = floor((double)delta/DAY);
        return [NSString stringWithFormat:@"%d天前", days];
    }
    else if (delta < 12 * MONTH)
    {
        int months = floor((double)delta/MONTH);
        return months <= 1 ? @"1个月前" : [NSString stringWithFormat:@"%d个月前", months];
    }
    
    int years = floor((double)delta/MONTH/12.0);
    return years <= 1 ? @"1年前" : [NSString stringWithFormat:@"%d年前", years];
}


- (NSString *)timeLeft
{
    long int delta = lround( [self timeIntervalSinceDate:[NSDate date]] );
    
    NSMutableString * result = [NSMutableString string];
    
    if ( delta >= YEAR )
    {
        NSInteger years = ( delta / YEAR );
        [result appendFormat:@"%ld年", (long)years];
        delta -= years * YEAR ;
    }
    
    if ( delta >= MONTH )
    {
        NSInteger months = ( delta / MONTH );
        [result appendFormat:@"%ld月", (long)months];
        delta -= months * MONTH ;
    }
    
    if ( delta >= DAY )
    {
        NSInteger days = ( delta / DAY );
        [result appendFormat:@"%ld天", (long)days];
        delta -= days * DAY ;
    }
    
    if ( delta >= HOUR )
    {
        NSInteger hours = ( delta / HOUR );
        [result appendFormat:@"%ld小时", (long)hours];
        delta -= hours * HOUR ;
    }
    
    if ( delta >= MINUTE )
    {
        NSInteger minutes = ( delta / MINUTE );
        [result appendFormat:@"%ld分钟", (long)minutes];
        delta -= minutes * MINUTE ;
    }
    
    NSInteger seconds = ( delta / SECOND );
    [result appendFormat:@"%ld秒", (long)seconds];
    
    return result;
}



@end
