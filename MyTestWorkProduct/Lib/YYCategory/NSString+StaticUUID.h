//
//  NSString+StaticUUID.h
//  XPay
//
//  Created by jack zhou on 2/12/15.
//  Copyright (c) 2015 jack zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

#define KBindingKey @"Binding"
#define KUserNameKey @"UserName"
static NSString *DeviceSecretKey = @"DeviceSecretKey";
static NSString *XAPIKeyChainService = @"XAPIKeyChainService";

@interface NSString (StaticUUID)
//获取UUID
//⚠️：一旦，钥匙串一直无法读取到UUID,设备号会变化一次，此时需要将设备重新绑定一次，后台会增加一台设备
+ (NSString *)stringWithStaticUUID;
//获取判定当前设备是否被绑定的数据字典
//⚠️：一旦，钥匙串一直无法读取到密码，会判断设备没有绑定，此时需要将设备重新绑定一次，后台不会增加设备量
+ (NSMutableDictionary *)dictWithBindingInfo;
//更新当前设备是否被绑定的状态
+ (void)saveBindingInfoWith:(NSNumber*)number;
//获取用户名
+ (NSString *)userNameString;
//保存用户名
+ (void)saveUserNameWith:(NSString*)userName;
@end
