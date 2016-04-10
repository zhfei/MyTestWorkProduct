//
//  CircleProgressViewController.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/3/3.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "CircleProgressViewController.h"
#import "Masonry.h"
#import "UIView+Image.h"

#import "CircleProgressView.h"

@interface CircleProgressViewController()
@property(strong,nonatomic)CircleProgressView *circle;
@end

@implementation CircleProgressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    self.title=@"圆形进度条";
    
    CircleProgressView *circle =[[CircleProgressView alloc]init];
    [circle setBounds:CGRectMake(0, 0, 300, 300)];
    [circle setCenter:self.view.center];
    [self.view addSubview:circle];
    self.circle=circle;
    [circle setProgress:0.1];
    [circle setBackgroundColor:[UIColor whiteColor]];
    
    UISlider *slider =[[UISlider alloc]init];
    [self.view addSubview:slider];
    [slider addTarget:self action:@selector(sliderValue:) forControlEvents:UIControlEventValueChanged];
    
    [slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200, 20));
        make.left.equalTo(circle.mas_left);
        make.top.equalTo(circle.mas_bottom).with.offset(100);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)sliderValue:(UISlider*)slider
{
    [self.circle setProgress:slider.value];
    
    [UIView addSimpleReflectionToView:self.circle];
}


@end
