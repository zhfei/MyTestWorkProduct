//
//  DrawRectView1.m
//  MyTestWorkProduct
//
//  Created by xuyefeng on 17/6/24.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "DrawRectView1.h"

@implementation DrawRectView1


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [@"程序员"drawInRect:CGRectMake(0,0,100,50)withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:[UIColor redColor]}];
}


@end
