//
//  DrawRectViewController.m
//  MyTestWorkProduct
//
//  Created by xuyefeng on 17/6/24.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "DrawRectViewController.h"
#import <Masonry/Masonry.h>
#import "DrawRectView1.h"
#import "DrawRectView2.h"

@interface DrawRectViewController ()

@end

@implementation DrawRectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    DrawRectView1 *drView1 = [DrawRectView1 new];
    [self.view addSubview:drView1];
    [drView1 setBackgroundColor:[UIColor blueColor]];
    [drView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.and.right.mas_equalTo(0);
        make.height.mas_equalTo(50);
    }];
    
    
    DrawRectView2 *drView2 = [DrawRectView2 new];
    [self.view addSubview:drView2];
    [drView2 setBackgroundColor:[UIColor lightGrayColor]];
    [drView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.mas_equalTo(0);
        make.top.mas_equalTo(drView1.mas_bottom);
        make.height.mas_equalTo(500);
    }];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
