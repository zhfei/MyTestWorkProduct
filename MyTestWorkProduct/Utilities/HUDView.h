//
//  HUDView.h
//  LiCai
//
//  Created by Tim on 11/9/14.
//  Copyright (c) 2014 aim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"


@interface HUDView : MBProgressHUD

+(id)showWithOnlyText:(NSString*)text;
+(id)showWithIndicator:(NSString*)text; //传nil 用默认的

+(void)hide;


@end
