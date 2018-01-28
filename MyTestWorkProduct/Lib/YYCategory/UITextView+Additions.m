//
//  UITextView+Additions.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/7/18.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "UITextView+Additions.h"

@implementation UITextView (Additions)
/*!
 *  @author zhoufei
 *
 *  @brief 快速创建一个textView
 */

+ (UITextView *)textView
{
    
    UITextView * textView =[[UITextView alloc]init];
    textView.bounds=CGRectMake(0, 0, ScreenWidth/2, ScreenHeigh/3);
    textView.center=CGPointMake(ScreenWidth/2, ScreenHeigh/3);
    textView.backgroundColor=[UIColor lightGrayColor];
    
    return textView;
}
@end
