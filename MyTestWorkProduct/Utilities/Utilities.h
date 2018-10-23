//
//  Utilities.h
//  LiCai
//
//  Created by Tim on 11/9/14.
//  Copyright (c) 2014 aim. All rights reserved.
//

#import <Foundation/Foundation.h>

#define  kKeySaveFavourite @"favourite"


@interface Utilities : NSObject

//获取label 高宽
+ (CGFloat)getTextHeight:(NSString *)text withSize:(CGSize)size withFont:(UIFont *)font;
+ (CGFloat)getTextWidth:(NSString *)text withSize:(CGSize)size withFont:(UIFont *)font;

//保存数据到本地
+(id)readLocationObjectWithkey:(NSString*)key;
+(BOOL)writeObjectToLocation:(id)object key:(NSString*)key;

//user deault
+(void)saveUserDefaultWithKeyBool:(NSString *)key Bool:(BOOL)value;
+(BOOL)boolValueForUserDefaultWithKey:(NSString *)key;

+(void)saveUserDefaultWithKeyInt:(NSString *)key integer:(NSInteger )value;
+(NSInteger)intValueForUserDefaultWithKey:(NSString *)key;

+(void)saveUserDefaultWithKeyValue:(NSString *)key Value:(id)value;
+(id)valueForUserDefaultWithKey:(NSString *)key;
+(void)removeValueForUserDefaultWithKey:(NSString *)key;

//检查电话号码
+(BOOL)checkPhonNum:(NSString*)phone;
//是否是4英寸
+(BOOL)isFourInchScreen;

//创建lable
+(UILabel *)createLabelFrame:(CGRect)frame andText:(NSString *)text andFont:(int)font andBackColor:(UIColor *)backcolor andNumofLine:(int)num andTextColor:(UIColor *)textcolor;

//创建按钮
+(UIButton *)createBtnFrame:(CGRect)frame andText:(NSString *)text andFont:(int)font andBackColor:(UIColor *)backcolor andTextColor:(UIColor *)textcolor andBackGroundImage:(NSString *)imageName;

//创建视图
+(UIView *)createViewFrame:(CGRect)frame andBackColor:(UIColor *)backcolor;
//创建imageV
+(UIImageView *)createImageViewFrame:(CGRect)frame andBackColor:(UIColor *)backcolor andImage:(NSString *)imageName andTouchEnable:(BOOL)isTouch;

+(NSString *)getUserID;  //获取uid

//获取当前月份第一天
+(NSString *)getFistDayEveryMonth;

//获取当前日期
+(NSString *)getCurrentDay;

+(NSString*)pathInBundleWithImageName:(NSString*)imageName;
/*!
 *  @author zhoufei
 *
 *  @brief 当前app版本号
 *
 *  @return 当前app版本号
 */
+(NSString*)appVersion;
/*!
 *  @author zhoufei
 *
 *  @brief 当前系统版本号
 *
 *  @return 当前系统版本号
 */
+(NSString*)systemVerson;

+ (UINavigationController *)currentNavigationCtl;

@end
