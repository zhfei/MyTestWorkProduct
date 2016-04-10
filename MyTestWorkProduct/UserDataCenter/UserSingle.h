//
//  UserSingle.h
//  LiCai
//
//  Created by Tim on 11/10/14.
//  Copyright (c) 2014 aim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfo.h"


@interface UserSingle : NSObject


@property (nonatomic,strong) UserInfo *userInfo;


+ (UserSingle *)defaultUser;




@end
