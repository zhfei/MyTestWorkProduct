//
//  AutoLayoutAnimViewController.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/4/4.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "AutoLayoutAnimViewController.h"

@interface AutoLayoutAnimViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftToSuperViewRight;
@property (weak, nonatomic) IBOutlet UISwitch *mySwitch;
- (IBAction)switchChanged:(UISwitch *)sender;

@end

@implementation AutoLayoutAnimViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSParagraphStyleAttributeName;
    NSParagraphStyle;
    NSMutableParagraphStyle;
    UILabel *lable =[[UILabel alloc]init];
    
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

- (IBAction)switchChanged:(UISwitch *)sender {
    if (sender.isOn) {
        [self.view layoutIfNeeded];

        [UIView animateWithDuration:1.0 animations:^{
            self.leftToSuperViewRight.priority=UILayoutPriorityDefaultHigh+1;
            self.leftToSuperViewRight.constant=self.view.bounds.size.width;
            [self.view layoutIfNeeded];
        }];
       
    }else{
        [self.view layoutIfNeeded];

        [UIView animateWithDuration:1.5 animations:^{
            self.leftToSuperViewRight.priority=UILayoutPriorityDefaultHigh+1;
            self.leftToSuperViewRight.constant=0;
            [self.view layoutIfNeeded];
        }];
    }
}
@end
