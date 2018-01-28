//
//  TransitionAnimation.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/6/27.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "TransitionAnimation.h"

@interface TransitionAnimation ()
@property (strong,nonatomic)BaseViewController *fromVC;
@property (strong,nonatomic)BaseViewController *toVC;

@end

@implementation TransitionAnimation
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.fromVC=[[BaseViewController alloc]init];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}
@end
