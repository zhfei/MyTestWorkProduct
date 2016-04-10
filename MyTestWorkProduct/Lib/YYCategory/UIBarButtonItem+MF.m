//
//  UIBarButtonItem+MF.m
//  ManageFinances
//
//  Created by liguowei on 14-7-2.
//  Copyright (c) 2014年 9frame. All rights reserved.
//

#import "UIBarButtonItem+MF.h"

@implementation UIBarButtonItem (MF)
+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon target:(id)target action:(SEL)action
{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if([icon isEqualToString:@""]){
        [button setBackgroundImage:nil forState:UIControlStateNormal];
    }else{
        [button setBackgroundImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    }
    
    if([highIcon isEqualToString:@""]){
        [button setBackgroundImage:nil forState:UIControlStateHighlighted];
    }else{
        [button setBackgroundImage:[UIImage imageNamed:highIcon] forState:UIControlStateHighlighted];
    }
    button.frame = (CGRect){CGPointZero, button.currentBackgroundImage.size};
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}


@end
