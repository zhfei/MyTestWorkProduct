//
//  TodayViewController.m
//  MyTodayExtension
//
//  Created by zhoufei on 2018/9/29.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
//#import "XDownLoadManager.h"
//#import "XFileManager.h"

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // 取出数据
    NSArray *myData = [[[NSUserDefaults alloc] initWithSuiteName:@"group.com.xkc.MyTestWorkProduct"] valueForKey:@"myShareData"];
    NSLog(@"TodayViewController--myData:%@",myData);
    
    self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeExpanded;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.extensionContext openURL:[NSURL URLWithString:@"MyTestWorkProduct://"] completionHandler:nil];
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

#pragma mark - 代理

- (void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)activeDisplayMode withMaximumSize:(CGSize)maxSize {
    if (activeDisplayMode == NCWidgetDisplayModeExpanded) {
        // 设置展开的新高度
        self.preferredContentSize = CGSizeMake(0, 200);
    }else{
        self.preferredContentSize = maxSize;
    }
}



@end
