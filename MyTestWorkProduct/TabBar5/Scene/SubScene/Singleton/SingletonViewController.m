//
//  SingletonViewController.m
//  MyTestWorkProduct
//
//  Created by xuyefeng on 17/2/19.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "SingletonViewController.h"
#import "SingletonTemplate.h"

@interface SingletonViewController ()

@end

@implementation SingletonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    SingletonTemplate *staa =[[SingletonTemplate alloc] init];
//    
//    NSLog(@"staa:%@",staa);
    
    [SingletonTemplate sharedSingletonTemplate];
    
    sleep(2);
    [SingletonTemplate destroyInstance];
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
