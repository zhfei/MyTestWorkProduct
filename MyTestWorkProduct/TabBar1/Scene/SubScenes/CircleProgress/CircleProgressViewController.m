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
#import "NSObject+RunTime.h"
#import "TestPerson.h"
#import "UIButton+Interval.h"

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
    [self.view addSubview:circle];
    self.circle=circle;
    [circle setProgress:0.1];
    [circle setBackgroundColor:[UIColor whiteColor]];
    [circle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200, 200));
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(20);
    }];
    
    UISlider *slider =[[UISlider alloc]init];
    [self.view addSubview:slider];
    [slider addTarget:self action:@selector(sliderValue:) forControlEvents:UIControlEventValueChanged];
    
    [slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(circle.mas_width);
        make.left.equalTo(circle.mas_left);
        make.top.equalTo(circle.mas_bottom);
    }];
    
    TestPerson *person=[[TestPerson alloc]init];
    person.collegeName=@"hello";
    person.sex=@"man";
    person.name=@"xiao ming";
    person.address=@"十里胡同";
    person.age=@(20);
    
    MyLog(@"person.property:%@",[person getObjectAllPropertyName]);
    MyLog(@"person.method:%@",[person getObjectAllMethodName]);
    MyLog(@"person.protocol:%@",[person getObjectAllAgreeProtocolName]);
    
    UIButton * btn =[[UIButton alloc]init];
    
    btn.bounds=CGRectMake(0, 0, 200, 44);
    btn.center=self.view.center;
    [btn setTitle:@"支 付" forState:UIControlStateNormal];
    btn.titleLabel.font=[UIFont systemFontOfSize:20];
    
    btn.layer.cornerRadius=5;
    btn.layer.masksToBounds=YES;
    
    [btn setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageWithColor:[UIColor blueColor]] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageWithColor:[UIColor lightGrayColor]] forState:UIControlStateDisabled];

    btn.showsTouchWhenHighlighted=YES;
    [self.view addSubview:btn];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)sliderValue:(UISlider*)slider
{
    [self.circle setProgress:slider.value];
    
//    [UIView addSimpleReflectionToView:self.circle];
}


@end
