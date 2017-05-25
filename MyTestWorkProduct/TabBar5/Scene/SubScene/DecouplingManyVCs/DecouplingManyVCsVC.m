//
//  DecouplingManyVCsVC.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/24.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "DecouplingManyVCsVC.h"
#import "EventDistributer.h"

@interface DecouplingManyVCsVC ()

@end

@implementation DecouplingManyVCsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSArray * array = @[KTestVC1,KTestVC2,KTestVC3];
    
    id vc = [EventDistributer sendViewControllerEvent:[array objectAtIndex:arc4random_uniform(3)] parametes:@"123"];
    
    [self.navigationController pushViewController:vc animated:YES];
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
