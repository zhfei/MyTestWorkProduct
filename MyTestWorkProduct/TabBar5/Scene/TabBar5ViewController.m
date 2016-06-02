//
//  TabBar5ViewController.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 15/11/3.
//  Copyright © 2015年 zhoufei. All rights reserved.
//

#import "TabBar5ViewController.h"

@interface TabBar5ViewController ()
@property(nonatomic,retain)UIActivityIndicatorView *act;
@end

@implementation TabBar5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIView *bg =[[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    bg.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    
    self.act=[[UIActivityIndicatorView  alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    //设置 风格;
    self.act.activityIndicatorViewStyle=UIActivityIndicatorViewStyleWhiteLarge;
    //设置活动指示器的颜色
//    self.act.color=[UIColor blueColor];
    //hidesWhenStopped默认为YES，会隐藏活动指示器。要改为NO
    self.act.hidesWhenStopped=YES;
    //启动
    [self.act startAnimating];
    
    //停止
//    [self.act stopAnimating];
    [bg addSubview:self.act];
    [self.view addSubview:bg];
    
    [self.act performSelector:@selector(stopAnimating) withObject:nil afterDelay:5];
    
    NSArray *testArray=@[@"0",@"1",@"2",@"3",@"4",@"5"];
    NSMutableArray *testAM=[NSMutableArray arrayWithArray:testArray];
    
    [testAM removeObjectAtIndex:1];
    id obj=[testAM objectAtIndex:1];
    NSLog(@"obj:%@",obj);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
   }

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
