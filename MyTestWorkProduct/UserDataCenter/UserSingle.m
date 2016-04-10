//
//  UserSingle.m
//  LiCai
//
//  Created by Tim on 11/10/14.
//  Copyright (c) 2014 aim. All rights reserved.
//

#import "UserSingle.h"
#import "UserInfo.h"


@implementation UserSingle


static UserSingle*DefaultUser;

+ (UserSingle *)defaultUser
{
    @synchronized(DefaultUser){
        if (!DefaultUser) {
            DefaultUser = [[UserSingle alloc] init];
        }
    }
    return DefaultUser;
}

- (id)init
{
    if (self = [super init]) {
        UserInfo *user = [[UserInfo alloc] init];
        self.userInfo = user;
        
    }

    return self;
}


@end
