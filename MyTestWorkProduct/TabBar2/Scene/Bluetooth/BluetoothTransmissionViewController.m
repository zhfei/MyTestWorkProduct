//
//  BluetoothTransmissionViewController.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/7/18.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "BluetoothTransmissionViewController.h"
#import "CentralViewController.h"
#import "PeripheralViewController.h"

@interface BluetoothTransmissionViewController()

@property (strong,nonatomic)UISegmentedControl *segment;

@property (strong,nonatomic)PeripheralViewController *Peripheral;
@property (strong,nonatomic)CentralViewController    *Central;
@end

@implementation BluetoothTransmissionViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.segment=[[UISegmentedControl alloc]initWithItems:@[@"外围设备",@"中央服务器"]];
    [self.view addSubview:self.segment];
    self.segment.bounds=CGRectMake(0, 0, 200, 40);
    self.segment.center=CGPointMake(ScreenWidth/2, 40);
    
    [self.segment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    
    
    //添加子控制器和子视图
    
    PeripheralViewController *Peripheral=[[PeripheralViewController alloc]init];
    CentralViewController    *Central   =[[CentralViewController alloc]init];
    
    [self addChildViewController:Peripheral];
    [self addChildViewController:Central];
    
    [self.view addSubview:Peripheral.view];
    [self.view addSubview:Central.view];

    self.Peripheral=Peripheral;
    self.Central=Central;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    CGFloat y =CGRectGetMaxY(self.segment.frame)+10;
    self.Central.view.frame=CGRectMake(0,y , self.view.bounds.size.width, self.view.bounds.size.height-y);
    self.Peripheral.view.frame=self.Central.view.frame;
    
    self.segment.selectedSegmentIndex=0;
    [self segmentAction:self.segment];
}


- (void)segmentAction:(UISegmentedControl*)segment
{
    if (segment.selectedSegmentIndex==0) {
        
        self.Peripheral.view.hidden=NO;
        self.Central.view.hidden=YES;
        
    }else if (segment.selectedSegmentIndex==1){
        self.Peripheral.view.hidden=YES;
        self.Central.view.hidden=NO;
    }
}

@end
