//
//  LocalNotificationViewController.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2018/1/31.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

#import "LocalNotificationViewController.h"
#import "LocalNotificationService.h"

@interface LocalNotificationViewController ()
@property (weak, nonatomic) IBOutlet UIButton *notificationBtn;
- (IBAction)notificationBtnAction:(UIButton *)sender;

@end

@implementation LocalNotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)notificationBtnAction:(UIButton *)sender {
    
    NSDate *fireDate = [NSDate dateWithTimeIntervalSinceNow:5.f];
    NSString *title = @"标题";
    NSString *body = @"内容";
    NSString *action = @"滑动";

    [LocalNotificationService addLocalNotification:fireDate alertTitle:title alertBody:body alertAction:action];
}
@end
