//
//  TemplateVC.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/11.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "TemplateVC.h"
#import "TpAVPlayer.h"
#import "TpNewPlayer.h"

@interface TemplateVC ()
- (IBAction)newPlayerAction:(id)sender;
- (IBAction)avPlayerAction:(id)sender;
- (IBAction)start:(id)sender;
- (IBAction)pause:(id)sender;
- (IBAction)stop:(id)sender;

@property (strong,nonatomic)TpPlayer * tpPlayer;
@end

@implementation TemplateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"模版模式";
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
- (IBAction)newPlayerAction:(id)sender {
    self.tpPlayer = [TpNewPlayer new];
}
- (IBAction)avPlayerAction:(id)sender {
    self.tpPlayer = [TpAVPlayer new];
}
- (IBAction)start:(id)sender {
  
    NSLog(@"%@",[self.tpPlayer play]);
}
- (IBAction)pause:(id)sender {

    NSLog(@"%@",[self.tpPlayer pause]);
}
- (IBAction)stop:(id)sender {

    NSLog(@"%@",[self.tpPlayer stop]);
}

@end
