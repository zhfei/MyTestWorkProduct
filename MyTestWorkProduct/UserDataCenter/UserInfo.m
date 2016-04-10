//
//  UserInfo.m
//  LiCai
//
//  Created by Tim on 11/10/14.
//  Copyright (c) 2014 aim. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo
#define KKeySaveUid         @"KKeySaveUid"
#define KKeySaveUserName    @"KKeySaveUserName"
#define KKeySaveIsLogin     @"KKeySaveIsLogin"
#define KKeySaveRoleID       @"KKeySaveRoleID"
#define KKeySaveAvatar      @"KKeySaveAvatar"
#define KKeySaveReceipt     @"KKeySaveReceipt"
#define KKeySaveLoginName     @"KKeySaveLoginName"
#define KKeySaveSortArray   @"KKeySaveSortArray"

-(id)init
{
    if (self = [super init]) {
        
        self.uid = @"0";
        self.userName = @"";
        self.avatar = @"";
        self.isLogin = NO;
        self.roleID=@"";
        self.receipt=@"";
        self.LoginName=@"";
        
    }
    return self;
    
  
}


+(UserInfo*)loadUserInfo
{

    UserInfo *user = [[UserInfo alloc] init];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    user.uid = [defaults valueForKey:KKeySaveUid];
    user.userName = [defaults valueForKey:KKeySaveUserName];
    user.avatar = [defaults valueForKey:KKeySaveAvatar];
    user.isLogin = [defaults boolForKey:KKeySaveIsLogin];
    user.roleID=[defaults valueForKey:KKeySaveRoleID];
    user.receipt=[defaults valueForKey:KKeySaveReceipt];
    user.LoginName=[defaults valueForKey:KKeySaveLoginName];
    
    
    return user;
    
}
+(void)clearUserInfo
{
    
    [[UserSingle defaultUser] userInfo].uid = @"";
    [[UserSingle defaultUser] userInfo].userName = @"";
    [[UserSingle defaultUser] userInfo].isLogin = NO;
    [[UserSingle defaultUser] userInfo].roleID  = @"";
    [[UserSingle defaultUser] userInfo].avatar  = @"";
    [[UserSingle defaultUser]userInfo].receipt=@"";
    [[UserSingle defaultUser]userInfo].LoginName=@"";
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:@"" forKey:KKeySaveUid];
    [defaults setValue:@"" forKey:KKeySaveUserName];
    [defaults setBool:NO forKey:KKeySaveIsLogin];
    [defaults setValue:@""forKey:KKeySaveReceipt];
    [defaults setValue:@""forKey:KKeySaveRoleID];
    [defaults setValue:@""forKey:KKeySaveAvatar];
    [defaults setValue:@""forKey:KKeySaveLoginName];
    
    [defaults synchronize];
}
+(void)saveUserInfo:(UserInfo*)user
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:user.uid forKey:KKeySaveUid];
     [defaults setValue:user.userName forKey:KKeySaveUserName];
    [defaults setValue:user.avatar forKey:KKeySaveAvatar];
    [defaults setBool:user.isLogin forKey:KKeySaveIsLogin];
    [defaults setValue:user.roleID forKey:KKeySaveRoleID];
    [defaults setValue:user.receipt forKey:KKeySaveReceipt];
    [defaults setValue:user.LoginName forKey:KKeySaveLoginName];
    
    
    [defaults synchronize];
    
}

+(BOOL)isLogin
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:KKeySaveIsLogin];
}
@end
