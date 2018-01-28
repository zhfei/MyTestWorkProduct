//
//  MyNavigationtroller.m
//  xueba
//
//  Created by Tim on 12/6/14.
//  Copyright (c) 2014 aim. All rights reserved.
//

#import "MyNavigationtroller.h"
#import "AppDelegate.h"


// 判断是否为iOS7
#define iOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)


@interface MyNavigationtroller ()

@end

@implementation MyNavigationtroller

+ (void)initialize
{
    // 1.取出设置主题的对象
    UINavigationBar *navBar = [UINavigationBar appearance];
//    navBar.translucent=NO;
    // 2.设置导航栏的背景图片 背景颜色
    if (iOS7) { // iOS7 以上
       
//        navBar.barTintColor = COLOR_THEME;
        
        //ios7以上 nav背景图片高 64
//         navBarBg = @"NavBar64";
//        [navBar setBackgroundImage:[UIImage imageNamed:navBarBg] forBarMetrics:UIBarMetricsDefault];
//

    } else { // iOS7 一下
//        navBar.tintColor = COLOR_THEME;
        
        //ios7以下 nav背景图片高 44
//        navBarBg = @"NavBar"; //
//        [navBar setBackgroundImage:[UIImage imageNamed:navBarBg] forBarMetrics:UIBarMetricsDefault];

    }
    
    // 3.标题
    
    [navBar setTitleTextAttributes:@{
                                     NSForegroundColorAttributeName:COLOR_THEME,
                                     NSFontAttributeName:[UIFont systemFontOfSize:18.f],
                                     
                                     }];
}

#pragma mark 控制状态栏的样式
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

+(void)createBackBtn:(UIViewController*)target
{
    if (isLargeIOS7) {
        UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icoBack_" ] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
        [btn setTintColor:[UIColor whiteColor]];
        target.navigationItem.leftBarButtonItem = btn;

    }else {
        UIImage *image1=[UIImage imageNamed:@"icoBack_"];
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:image1 forState:UIControlStateNormal];
        [button setFrame: CGRectMake(0, 0, image1.size.width, image1.size.height)];
        [button addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem * barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        target.navigationItem.leftBarButtonItem = barButtonItem;
    }
    
}
+(void)backAction
{
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    MyNavigationtroller *controller = (MyNavigationtroller *)app.tabBarController.selectedViewController ;
    [controller popViewControllerAnimated:YES] ;
}

+(void)createLeftBtnImage:(UIImage*)image target:(UIViewController*)target action:(SEL)selector
{
    if (isLargeIOS7) {
        UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:target action:selector];
        [btn setTintColor:[UIColor whiteColor]];
        target.navigationItem.leftBarButtonItem = btn;
    }
    else{
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:image forState:UIControlStateNormal];
        [button setFrame: CGRectMake(0, 0, image.size.width, image.size.height)];
        [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem * barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        target.navigationItem.leftBarButtonItem = barButtonItem;
    }

}

+(void)createLeftBtnTitle:(NSString*)title target:(UIViewController*)target action:(SEL)selector
{
    if (isLargeIOS7) {
        UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:selector];
        [btn setTintColor:[UIColor whiteColor]];
        target.navigationItem.leftBarButtonItem = btn;

    }
    else{
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:title forState:UIControlStateNormal];
        [button setFrame: CGRectMake(0, 0, 42, 22)];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem * barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        target.navigationItem.leftBarButtonItem = barButtonItem;
        
    }

}

+(void)createRightBtnImage:(UIImage*)image target:(UIViewController*)target action:(SEL)selector
{
    if (isLargeIOS7) {
        UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:target action:selector];
        [btn setTintColor:[UIColor whiteColor]];
        target.navigationItem.rightBarButtonItem = btn;
    }
    else {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:image forState:UIControlStateNormal];
        [button setFrame: CGRectMake(0, 0, image.size.width, image.size.height)];
        [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem * barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        target.navigationItem.rightBarButtonItem = barButtonItem;
        
    }
}

+(void)createRightBtnTitle:(NSString*)title target:(UIViewController*)target action:(SEL)selector
{
    if (isLargeIOS7) {
        UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:selector];
        [btn setTintColor:[UIColor whiteColor]];
        target.navigationItem.rightBarButtonItem = btn;

    }
    else{
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame: CGRectMake(0, 0, 42, 22)];
        [button setTitle:[NSString stringWithFormat:@"%@",title] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor clearColor]];
        [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem * barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        target.navigationItem.rightBarButtonItem = barButtonItem;
        

    }
}


+(void)createRightBtnImages:(NSArray*)imagesArray target:(UIViewController*)target action1:(SEL)selector1 action2:(SEL)selector2
{
    if (isLargeIOS7) {
        // 这里需要注意：由于是想让图片右移，所以left需要设置为正，right需要设置为负。正在是相反的。
        // 让按钮图片右移15
        
        UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *image1 = [imagesArray objectAtIndex:0];
        button1.frame = CGRectMake(0, 0, image1.size.width, image1.size.height);
        [button1 setImageEdgeInsets:UIEdgeInsetsMake(0, 5, 0, -5)];
        [button1 setImage:image1 forState:UIControlStateNormal];
        [button1 addTarget:target action:selector2 forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *barBtn1=[[UIBarButtonItem alloc]initWithCustomView:button1];
        
        
        UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *image2 = [imagesArray objectAtIndex:1];
        button2.frame = CGRectMake(0, 0, image2.size.width, image2.size.height);
        [button2 setImageEdgeInsets:UIEdgeInsetsMake(0, 5, 0, -5)];
        [button2 setImage:image2 forState:UIControlStateNormal];
        [button2 addTarget:target action:selector1 forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *barBtn2=[[UIBarButtonItem alloc]initWithCustomView:button2];
        
        NSArray *array = [[NSArray alloc] initWithObjects:barBtn1,barBtn2, nil];
        target.navigationItem.rightBarButtonItems = array;

    }else
    {
        UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        button1.backgroundColor=[UIColor clearColor];
        UIImage *image1 = [imagesArray objectAtIndex:0];
        button1.frame = CGRectMake(0, 0, image1.size.width, image1.size.height);
        [button1 setImage:image1 forState:UIControlStateNormal];
        [button1 addTarget:target action:selector1 forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *barBtn1=[[UIBarButtonItem alloc]initWithCustomView:button1];
        
        UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        button2.backgroundColor=[UIColor clearColor];
        UIImage *image2 = [imagesArray objectAtIndex:1];
        button2.frame = CGRectMake(0, 0, image2.size.width, image2.size.height);
        [button2 setImage:image2 forState:UIControlStateNormal];
        [button2 addTarget:target action:selector2 forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *barBtn2=[[UIBarButtonItem alloc]initWithCustomView:button2];
        
        NSArray *array = [[NSArray alloc] initWithObjects:barBtn1,barBtn2, nil];
        target.navigationItem.rightBarButtonItems = array;
    }

}



@end
