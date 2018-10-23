//
//  SystemSharedVC.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2018/10/19.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

#import "SystemSharedVC.h"

@interface SystemSharedVC ()

@end

@implementation SystemSharedVC
- (IBAction)shareAction:(UIButton *)sender {
    id shareText = @"分享文本信息";
//    id shareImage = [UIImage imageNamed:@"settings_colorful_share"];
    id shareUrl = [NSURL URLWithString:@"https://www.apple.com"];
    id activityItems = @[shareText,shareUrl] ;
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    activityVC.modalInPopover = YES;
    [self presentViewController:activityVC animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
