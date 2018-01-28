//
//  BuilderVC.m
//  MyTestWorkProduct
//
//  Created by xuyefeng on 17/5/11.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "BuilderVC.h"
#import "Director.h"
#import "BuickExcelleGTBuilder.h"
#import "BuickCar.h"

@interface BuilderVC ()

@end

@implementation BuilderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"建造者模式";
    
    BuickExcelleGTBuilder * exBuilder = [BuickExcelleGTBuilder new];
    BuickCar * car = [Director creatBuickCar:exBuilder];
    
    NSLog(@"%@",car);
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
