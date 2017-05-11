//
//  FacadeVC.m
//  MyTestWorkProduct
//
//  Created by xuyefeng on 17/5/11.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "FacadeVC.h"
#import "4SWaiter.h"

@interface FacadeVC (){
    _SWaiter * waiter;
}
    
- (IBAction)loanPay:(id)sender;

- (IBAction)cashPay:(id)sender;
@end

@implementation FacadeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    waiter = [_SWaiter new];
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

- (IBAction)loanPay:(id)sender {
    [waiter buyCarWithLoad];
}
    
- (IBAction)cashPay:(id)sender {
    [waiter buyCarWithCash];
}
@end
