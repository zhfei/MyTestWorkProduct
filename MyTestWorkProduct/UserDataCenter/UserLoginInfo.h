//
//  UserLoginInfo.h
//  Product
//
//  Created by zhoufei on 16/2/2.
//  Copyright © 2016年 zhoufei. All rights reserved.
//
//  侧重于稳定性和安全性

#import <Foundation/Foundation.h>

#define KBindingKey @"Binding"
#define KUserNameKey @"UserName"
#define KPassWord  @"passwordKey"
#define KUUID       @"XUUID"

static NSString *DeviceSecretKey = @"DeviceSecretKey";
static NSString *XAPIKeyChainService = @"XAPIKeyChainService";

@interface UserLoginInfo : NSObject
+(instancetype)sharedInstance;

//获取UUID
//⚠️：一旦，钥匙串一直无法读取到UUID,设备号会变化一次，此时需要将设备重新绑定一次，后台会增加一台设备
- (NSString *)stringWithStaticUUID;

//⚠️：一旦，钥匙串一直无法读取到密码，会判断设备没有绑定，此时需要将设备重新绑定一次，后台不会增加设备量
- (BOOL)bindingWithDevice;
//更新当前设备是否被绑定的状态
- (void)saveBindingInfoWith:(NSNumber*)number;

//获取用户名
- (NSString *)userNameString;
//保存用户名
- (void)saveUserNameWith:(NSString*)userName;

///获取密码
- (NSString *)passwordStringWithUserName:(NSString *)userName;
///保存密码
- (void)savePassWordWith:(NSString*)password;

//通用
- (void)saveSimpleString:(NSString *)simpleString simpleKey:(NSString *)simpleKey;
- (NSString *)getSimpleStringWithSimpleKey:(NSString *)simpleKey;

@end
