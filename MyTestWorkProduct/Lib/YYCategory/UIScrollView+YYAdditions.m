//
//  UIScrollView+YYAdditions.m
//  YY
//
//  Created by liguowei on 14-10-14.
//  Copyright (c) 2014年 itbox. All rights reserved.
//

#import "UIScrollView+YYAdditions.h"

@implementation UIScrollView (YYAdditions)

-(void)scrollToTopAnimation:(BOOL)animation{
    [self scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:animation];
}

@end
