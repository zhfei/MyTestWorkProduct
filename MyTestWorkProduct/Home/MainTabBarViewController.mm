//
//  RootViewController.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 15/11/2.
//  Copyright © 2015年 zhoufei. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "MyNavigationtroller.h"
#import "TabBar1ViewController.h"
#import "TabBar2ViewController.h"
#import "TabBar3ViewController.h"
#import "TabBar4ViewController.h"
#import "TabBar5ViewController.h"

#import "UIImage+FontAwesome.h"
#import "NSString+FontAwesome.h"
#import "UIImage+YYAdditions.h"
#import "OptionHeadlineHelper.h"

#define kTopY -15

@interface MainTabBarViewController ()
{
    NSMutableArray *controlArray;
}
@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [[OptionHeadlineHelper sharedOptionHeadlineHelper] dictionayInfo];
    
    [self createControls];
}

-(void)createControls
{
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15],NSFontAttributeName, nil]forState:UIControlStateNormal];
    
    
    TabBar1ViewController *tab1=[[TabBar1ViewController alloc]init];
    MyNavigationtroller *nav1=[[MyNavigationtroller alloc]initWithRootViewController:tab1];
    nav1.title=@"第一项";
    //赋值图片
    
//    NSString *imageName =[NSString fontAwesomeIconStringForEnum:FAMusic];
//    UIImage *image =[UIImage imageWithIcon:imageName backgroundColor:[UIColor whiteColor] iconColor:[UIColor redColor] andSize:CGSizeMake(60, 40)];
//    
//    NSString *imageSelectName =[NSString fontAwesomeIconStringForEnum:FASearch];
//    UIImage *imageSelect =[UIImage imageWithIcon:imageSelectName backgroundColor:[UIColor blueColor] iconColor:[UIColor redColor] andSize:CGSizeMake(60, 40)];
    
    
//    nav1.tabBarItem.image=image;
//    nav1.tabBarItem.selectedImage=imageSelect;
//    self.delegate = tab1;
    
    TabBar2ViewController *tab2=[[TabBar2ViewController alloc]init];
    MyNavigationtroller *nav2=[[MyNavigationtroller alloc]initWithRootViewController:tab2];
    nav2.title=@"第二项";
    
    
    TabBar3ViewController *tab3=[[TabBar3ViewController alloc]init];
    MyNavigationtroller *nav3=[[MyNavigationtroller alloc]initWithRootViewController:tab3];
    nav3.title=@"第三项";
    nav3.tabBarItem.image=[UIImage imageNamed:@"tab03_"];
    nav3.tabBarItem.selectedImage=[UIImage imageNamed:@"tabPre03_"];
    
    TabBar4ViewController *tab4=[[TabBar4ViewController alloc]init];
    MyNavigationtroller *nav4=[[MyNavigationtroller alloc]initWithRootViewController:tab4];
    nav4.title=@"第四项";
    nav4.tabBarItem.image=[UIImage imageNamed:@"tab04_"];
    nav4.tabBarItem.selectedImage=[UIImage imageNamed:@"tabPre04_"];
    
    TabBar5ViewController *tab5=[[TabBar5ViewController alloc]init];
    MyNavigationtroller *nav5=[[MyNavigationtroller alloc]initWithRootViewController:tab5];
    nav5.title=@"第五项";
    nav5.tabBarItem.image=[UIImage imageNamed:@"tab05_"];
    nav5.tabBarItem.selectedImage=[UIImage imageNamed:@"tabPre05_"];
    
    nav1.tabBarItem.titlePositionAdjustment=UIOffsetMake(0, kTopY);
    nav2.tabBarItem.titlePositionAdjustment=UIOffsetMake(0, kTopY);
    nav3.tabBarItem.titlePositionAdjustment=UIOffsetMake(0, kTopY);
    nav4.tabBarItem.titlePositionAdjustment=UIOffsetMake(0, kTopY);
    nav5.tabBarItem.titlePositionAdjustment=UIOffsetMake(0, kTopY);


    
    
    controlArray=[[NSMutableArray alloc]initWithObjects:nav1,nav2,nav3,nav4,nav5, nil];
    self.viewControllers=controlArray;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
