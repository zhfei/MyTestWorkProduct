//
//  UserInfo.h
//  LiCai
//
//  Created by Tim on 11/10/14.
//  Copyright (c) 2014 aim. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import"ShangPinListModel.h"

@interface UserInfo : NSObject

//根据具体项目添加
@property (nonatomic,strong) NSString *uid;
@property (nonatomic,copy) NSString *userName;
@property (nonatomic,copy) NSString *avatar;
@property(nonatomic,copy) NSString *receipt;  //1：开发票 2：不开发票
@property (nonatomic,assign) BOOL isLogin;
@property (nonatomic,copy) NSString *LoginName;  //登陆名  推送使用
//4：店员   5：业务员 7：分部经理   8：大区域经理   11总部
@property(nonatomic,strong)NSString *roleID;

@property (nonatomic,copy) NSString *address;  //地址
@property (nonatomic,copy) NSString *addressID;

@property (nonatomic,copy) NSString *store_id; //用户来源
@property (nonatomic,copy) NSString *store_name; //用户来源

@property (nonatomic,copy) NSString *mendian_id; //门店id
@property (nonatomic,copy) NSString *mendian_name; //门店名

//@property (nonatomic,strong)ShangPinListModel *model;//补交订单选择的商品

@property (nonatomic,strong)NSMutableArray *roleSortArray; //登录返回的角色显示

+(UserInfo*)loadUserInfo; //加载本地

+(void)saveUserInfo:(UserInfo*)user;  //保存本地 ... 如果没特殊要求一般不用保存本地

+(void)clearUserInfo;  //注销

+(BOOL)isLogin;

@end
