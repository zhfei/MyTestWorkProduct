//
//  AppDelegate.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 15/11/2.
//  Copyright © 2015年 zhoufei. All rights reserved.
//

#import "AppDelegate.h"
#import "MainTabBarViewController.h"
#import <Bugtags/Bugtags.h>
//#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <objc/runtime.h>

//


BMKMapManager* _mapManager;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    instrumentObjcMessageSends(YES);
    
    [self registerLocaltionNotional:application didFinishLaunchingWithOptions:launchOptions];
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    [self.window setBackgroundColor:[UIColor whiteColor]];
    [self.window makeKeyAndVisible];
    
    MainTabBarViewController *mainTab=[[MainTabBarViewController alloc]init];
    self.window.rootViewController=mainTab;
    self.tabBarController = mainTab;
    
    BugtagsOptions *options = [[BugtagsOptions alloc] init];
    options.trackingCrashes = YES;        // 是否收集闪退，联机 Debug 状态下默认 NO，其它情况默认 YES
    options.trackingUserSteps = YES;      // 是否跟踪用户操作步骤，默认 YES
    options.trackingConsoleLog = YES;     // 是否收集控制台日志，默认 YES
    options.trackingUserLocation = YES;   // 是否获取位置，默认 YES
    options.trackingNetwork = YES;        // 是否跟踪网络请求，默认 NO
    // 设置需要跟踪的网络请求 URL，多个地址用 | 隔开，
    // 支持正则表达式，不设置则跟踪所有请求
    options.trackingNetworkURLFilter = @"portal.qiniu.com｜baidu.com";
    options.crashWithScreenshot = YES;    // 收集闪退是否附带截图，默认 YES

    [Bugtags startWithAppKey:APP_KEY invocationEvent:BTGInvocationEventBubble options:options];
    
    
    // 要使用百度地图，请先启动BaiduMapManager
    _mapManager = [[BMKMapManager alloc]init];
    BOOL ret = [_mapManager start:Baidu_KEY generalDelegate:self];
    if (!ret) {
        NSLog(@"manager start failed!");
    }

    
//    [Bugtags startWithAppKey:APP_KEY invocationEvent:BTGInvocationEventBubble];

    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
//    [BMKMapView willBackGround];//当应用即将后台时调用，停止一切调用opengl相关的操作

}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
//    [BMKMapView didForeGround];//当应用恢复前台状态时调用，回复地图的渲染和opengl相关的操作

}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    NSLog(@"收到本地通知");
    // 可以让用户跳转到指定界面 app在前台接收到通知直接跳转界面不太好,所以要判断一下,是从后台进入前台还是本身就在前台
    if (application.applicationState == UIApplicationStateInactive) {// 进入前台时候
        NSLog(@"跳转到指定界面");
        
        // 如果接收到不同的通知,跳转到不同的界面:
        NSLog(@"%@", notification.userInfo); //通知的额外信息,根据设置的通知的额外信息确定
        
    }
}


- (void)registerLocaltionNotional:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //打开app时候,消除掉badge
    [application setApplicationIconBadgeNumber:0];
    
    if ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0) {
        // iOS8以后 本地通知必须注册(获取权限)
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert categories:nil];
        
        [application registerUserNotificationSettings:settings];
    }
    
    
    // 页面跳转(针对应用程序被杀死的页面跳转)
    /* launchOptions: 1.点击图标打开是空的
     2.应用间跳转是有值的
     3.杀死的应用接收到本地通知,也是有值的
     虽然说launchOptions有值,但是他们不同的key有值
     
     */
    
    if (launchOptions[UIApplicationLaunchOptionsLocalNotificationKey]) { // 如果这个key有值,代表是杀死的程序接收到本地通知跳转
        
        // 根据这种方式查看launchOptions的内容
        UILabel *infoLabel = [[UILabel alloc] init];
        infoLabel.frame = CGRectMake(0, 0, 300, 300);
        infoLabel.backgroundColor = [UIColor yellowColor];
        infoLabel.numberOfLines = 0;
        infoLabel.font = [UIFont systemFontOfSize:10];
        infoLabel.text = [NSString stringWithFormat:@"%@",launchOptions];
        [self.window.rootViewController.view addSubview:infoLabel];
        
        
        NSLog(@"跳转到指定页面");
    }
    
}

@end
