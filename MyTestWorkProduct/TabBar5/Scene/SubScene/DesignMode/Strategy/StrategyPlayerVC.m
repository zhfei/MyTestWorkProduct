//
//  StrategyPlayerVC.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/10.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "StrategyPlayerVC.h"
#import "StPlayerProtocol.h"
#import "StNormalPlayer.h"

@interface StrategyPlayerVC ()
@property (strong,nonatomic)id<StPlayerProtocol> normalPlayer;

- (IBAction)newPlayerAction:(id)sender;
- (IBAction)avPlayerAction:(id)sender;
- (IBAction)start:(id)sender;
- (IBAction)pause:(id)sender;
- (IBAction)stop:(id)sender;

@end

@implementation StrategyPlayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"策略模式";
    
    [self avPlayerAction:nil];
    
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
    self.normalPlayer = [[StNormalPlayer alloc]initWithPlayerType:PlayerType_NewPlayer];
}

- (IBAction)avPlayerAction:(id)sender {
    self.normalPlayer = [[StNormalPlayer alloc]initWithPlayerType:PlayerType_AVPlayer];
}

- (IBAction)start:(id)sender {
    NSLog(@"%@",[self.normalPlayer st_play]);
}

- (IBAction)pause:(id)sender {
    NSLog(@"%@",[self.normalPlayer st_pause]);
}

- (IBAction)stop:(id)sender {
    NSLog(@"%@",[self.normalPlayer st_stop]);
}
@end
