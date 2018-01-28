//
//  DelaySwitchViewController.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/12/15.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "DelaySwitchViewController.h"
#import "UISwitch+DelaySwitch.h"

@interface DelaySwitchViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *mySwitch;
- (IBAction)switchAction:(UISwitch *)sender;

@end

@implementation DelaySwitchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //[self.mySwitch addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)switchAction:(UISwitch *)sender {
    sender.enabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        sender.enabled = YES;
    });
}
@end
