//
//  JSProtolObj.m
//  MyTestWorkProduct
//
//  Created by 周飞 on 18/4/16.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

#import "JSProtolObj.h"

@implementation JSProtolObj

@synthesize sum = _sum;

- (NSInteger)add:(int)a b:(int)b {

    return a+b;
}

- (void)setSum:(NSInteger)sum {

    _sum = sum;
}

@end
