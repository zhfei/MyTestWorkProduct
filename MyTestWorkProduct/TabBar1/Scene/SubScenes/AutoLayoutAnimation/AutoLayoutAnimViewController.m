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

@property (nonatomic,strong)NSMutableArray *arrayM;

@end

@implementation AutoLayoutAnimViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    NSParagraphStyleAttributeName;
//    NSParagraphStyle;
//    NSMutableParagraphStyle;
//    UILabel *lable =[[UILabel alloc]init];
//    NSTextAttachment;
//    UIBlurEffect;
    
 
//    [UIView animateWithDuration:1.5 delay:0.5 options:UIViewAnimationOptionRepeat animations:^{
//        self.mySwitch.alpha=0;
//    } completion:^(BOOL finished) {
//        self.mySwitch.alpha=1;
//
//    }];
    
    [UIView animateWithDuration:1.5 delay:0.5 usingSpringWithDamping:0.5 initialSpringVelocity:2 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.mySwitch.center=CGPointMake(self.mySwitch.center.x, 500);
    } completion:^(BOOL finished) {
        self.mySwitch.center=CGPointMake(self.mySwitch.center.x, 100);
    }];
    
    NSMutableArray *array =[NSMutableArray arrayWithObjects:@"1",@"2", nil];
    self.arrayM=array;
    [self.arrayM insertObject:@"0" atIndex:0];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



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
