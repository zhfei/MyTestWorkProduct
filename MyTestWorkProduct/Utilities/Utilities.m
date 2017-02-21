//
//  Utilities.m
//  LiCai
//
//  Created by Tim on 11/9/14.
//  Copyright (c) 2014 aim. All rights reserved.
//

#import "Utilities.h"

@implementation Utilities

+ (CGFloat)getTextHeight:(NSString *)text withSize:(CGSize)size withFont:(UIFont *)font
{
    CGSize resultSize;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5];//调整行间距

    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0){
        
        NSDictionary *attribute = @{NSFontAttributeName: font,NSParagraphStyleAttributeName:paragraphStyle};
        resultSize = [text boundingRectWithSize:size options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    }else{
        
        resultSize = [text sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
    }
    
    
    return ceilf(resultSize.height);

}


+ (CGFloat)getTextWidth:(NSString *)text withSize:(CGSize)size withFont:(UIFont *)font
{
    CGSize resultSize;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5];//调整行间距
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0){
        
        NSDictionary *attribute = @{NSFontAttributeName: font,NSParagraphStyleAttributeName:paragraphStyle};
        resultSize = [text boundingRectWithSize:size options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    }else{
        
        resultSize = [text sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
    }
    
    
    return ceilf(resultSize.width);


}


//
+(BOOL)writeObjectToLocation:(id)object key:(NSString*)key
{
    
    
    //    NSLog(@"favourite ::: %@",array);
    NSMutableData * data = [[NSMutableData alloc]init];
    NSKeyedArchiver * archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    [archiver encodeObject:object forKey:key];
    [archiver finishEncoding];
     return [data writeToFile:[self filePathplist:key] atomically:YES];
}

+(id)readLocationObjectWithkey:(NSString*)key
{
   // NSMutableArray *array=[[NSMutableArray alloc] initWithCapacity:0];
    id object = Nil;
    if([[NSFileManager defaultManager] fileExistsAtPath:[self filePathplist:key]]){
        NSData * data = [[NSData alloc]initWithContentsOfFile:[self filePathplist:key]];
        NSKeyedUnarchiver * unarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
        object=[unarchiver decodeObjectForKey:key];
    }
    return object;
}

+(NSString *) filePathplist:(NSString *)key
{
    NSArray * array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * docPath = [array objectAtIndex:0];
    NSString * fileName = [docPath stringByAppendingPathComponent:key];
    return fileName;
}


+(void)saveUserDefaultWithKeyBool:(NSString *)key Bool:(BOOL)value{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:value forKey:key];
    [defaults synchronize];
}

+ (BOOL)boolValueForUserDefaultWithKey:(NSString *)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:key];
}

+(void)saveUserDefaultWithKeyInt:(NSString *)key integer:(NSInteger)value{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:value forKey:key];
    [defaults synchronize];
}


+(NSInteger)intValueForUserDefaultWithKey:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults integerForKey:key];
}

+(void)saveUserDefaultWithKeyValue:(NSString *)key Value:(id)value{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (value == nil) {
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
            
        }else{
            [defaults setObject:[NSNull null] forKey:key];
        }
        
    }else{
        [defaults setObject:value forKey:key];
    }
    
    [defaults synchronize];
}

+(id)valueForUserDefaultWithKey:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults valueForKey:key];
}

+(void)removeValueForUserDefaultWithKey:(NSString *)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:key];
}


//检查手机号是否正确
+(BOOL)checkPhonNum:(NSString*)phone
{
    NSString *phoneReg = @"^1[3|4|5|7|8][0-9](\\d){8,8}$";
    
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneReg];
    
    BOOL isMatch = [pred evaluateWithObject:phone];
    
    
    if (isMatch) {
        return YES;
    }
    else{
        
        return NO;
    }

}


+(BOOL)isFourInchScreen
{

    BOOL isFourInchScreen = (fabs(CGRectGetHeight([[UIScreen mainScreen] bounds]) - 568.0f) < DBL_EPSILON);
    
    return isFourInchScreen;
    
}


+(UILabel *)createLabelFrame:(CGRect)frame andText:(NSString *)text andFont:(int)font andBackColor:(UIColor *)backcolor andNumofLine:(int)num andTextColor:(UIColor *)textcolor;
{
    UILabel * introL=[[UILabel alloc] initWithFrame:frame];
    introL.font=[UIFont systemFontOfSize:font];
    introL.backgroundColor=backcolor;
    introL.numberOfLines=num;
    introL.text=text;
    introL.textColor=textcolor;
    return introL;
    
}

+(UIButton *)createBtnFrame:(CGRect)frame andText:(NSString *)text andFont:(int)font andBackColor:(UIColor *)backcolor andTextColor:(UIColor *)textcolor andBackGroundImage:(NSString *)imageName
{
    UIButton * btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=frame;
    [btn setTitle:text forState:UIControlStateNormal];
    [btn setTitleColor:textcolor forState:UIControlStateNormal];
    [btn setBackgroundColor:backcolor];
    [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    btn.titleLabel.font=[UIFont systemFontOfSize:font];
    return btn;
}

+(UIView *)createViewFrame:(CGRect)frame andBackColor:(UIColor *)backcolor
{
    UIView *view=[[UIView alloc]initWithFrame:frame];
    view.backgroundColor=backcolor;
    return view;
}

+(UIImageView *)createImageViewFrame:(CGRect)frame andBackColor:(UIColor *)backcolor andImage:(NSString *)imageName andTouchEnable:(BOOL)isTouch
{
    UIImageView *imageV=[[UIImageView alloc]initWithFrame:frame];
    imageV.image=[UIImage imageNamed:imageName];
    imageV.backgroundColor=backcolor;
    if (isTouch==YES) {
        imageV.userInteractionEnabled=YES;
    }
    else{
        imageV.userInteractionEnabled=NO;
    }
    return imageV;
}


+(NSString *)getUserID
{
//    NSString *uid=[UserSingle  defaultUser].userInfo.uid;
//    BOOL islogin=[UserSingle defaultUser].userInfo.isLogin;
//    if (islogin==NO) {
//        uid=@"0";
//    }
//    return uid;
    return @"";
}

//获取当前月份第一天
+(NSString *)getFistDayEveryMonth
{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
   
    NSDate *now = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *comps = [cal
                               components:NSYearCalendarUnit | NSMonthCalendarUnit
                               fromDate:now];
    comps.day = 1;
    NSDate *firstDay = [cal dateFromComponents:comps];
    NSString *first=[dateFormatter stringFromDate:firstDay];
    
    return first;
}


//获取当前日期
+(NSString *)getCurrentDay
{
    NSDate *selectDate=[NSDate date];
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *currentDay=[dateFormatter stringFromDate:selectDate];
    
    return currentDay;
}

+(NSString*)pathInBundleWithImageName:(NSString*)imageName
{
    return  [[NSBundle mainBundle] pathForResource:imageName ofType:@"png"];
}

+ (NSString *)appVersion
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    CFShow((__bridge CFTypeRef)(infoDictionary));
//    // app名称
//    NSString *app_Name = [infoDictionary objectForKey:@"CFBundleDisplayName"];
    // app版本
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
//    // app build版本
//    NSString *app_build = [infoDictionary objectForKey:@"CFBundleVersion"];
    
    
    
//    //手机序列号
//    NSString* identifierNumber = [[UIDevice currentDevice] uniqueIdentifier];
//    NSLog(@"手机序列号: %@",identifierNumber);
//    //手机别名： 用户定义的名称
//    NSString* userPhoneName = [[UIDevice currentDevice] name];
//    NSLog(@"手机别名: %@", userPhoneName);
//    //设备名称
//    NSString* deviceName = [[UIDevice currentDevice] systemName];
//    NSLog(@"设备名称: %@",deviceName );
//    //手机系统版本
//    NSString* phoneVersion = [[UIDevice currentDevice] systemVersion];
//    NSLog(@"手机系统版本: %@", phoneVersion);
//    //手机型号
//    NSString* phoneModel = [[UIDevice currentDevice] model];
//    NSLog(@"手机型号: %@",phoneModel );
//    //地方型号  （国际化区域名称）
//    NSString* localPhoneModel = [[UIDevice currentDevice] localizedModel];
//    NSLog(@"国际化区域名称: %@",localPhoneModel );
    
//    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
//    // 当前应用名称
//    NSString *appCurName = [infoDictionary objectForKey:@"CFBundleDisplayName"];
//    NSLog(@"当前应用名称：%@",appCurName);
//    // 当前应用软件版本  比如：1.0.1
//    NSString *appCurVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
//    NSLog(@"当前应用软件版本:%@",appCurVersion);
//    // 当前应用版本号码   int类型
//    NSString *appCurVersionNum = [infoDictionary objectForKey:@"CFBundleVersion"];
//    NSLog(@"当前应用版本号码：%@",appCurVersionNum);
    
    return app_Version;
}

+(NSString*)systemVerson
{
   return [[UIDevice currentDevice]systemVersion];
}

@end
