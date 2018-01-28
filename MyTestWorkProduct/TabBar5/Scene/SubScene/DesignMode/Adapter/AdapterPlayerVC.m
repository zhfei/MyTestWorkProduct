//
//  AdapterPlayerVC.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/8.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "AdapterPlayerVC.h"
#import "AVPlayer.h"
#import "PlayerAdapter.h"

@interface AdapterPlayerVC ()
{
    id<AVPlayerProtocol> __player;
}
- (IBAction)ChoosePlayer:(UIButton *)sender;
- (IBAction)play:(UIButton *)sender;
- (IBAction)pause:(UIButton *)sender;
- (IBAction)stop:(UIButton *)sender;
- (IBAction)newPlayer:(UIButton *)sender;

@end

@implementation AdapterPlayerVC

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

- (IBAction)ChoosePlayer:(UIButton *)sender {
    
    __player = [AVPlayer new];
}

- (IBAction)play:(UIButton *)sender {
    
    NSLog(@"%@",__player.a_play);
}

- (IBAction)pause:(UIButton *)sender {
    
    NSLog(@"%@",__player.a_pause);
}

- (IBAction)stop:(UIButton *)sender {
    
    NSLog(@"%@",__player.a_stop);
}

- (IBAction)newPlayer:(UIButton *)sender {
    
    NewPlayer * np = [NewPlayer new];
    __player = [[PlayerAdapter alloc]initWithNewPlayer:np];
}
@end
