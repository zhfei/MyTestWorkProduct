//
//  AnimationScene2.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/1/8.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "AnimationScene2.h"
#import "MyHUDView.h"

@interface AnimationScene2 ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *mySegment;
- (IBAction)segmentAction:(UISegmentedControl *)sender;
- (IBAction)BtnAction:(UIButton *)sender;

@end

@implementation AnimationScene2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
  
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
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

- (IBAction)segmentAction:(UISegmentedControl *)sender {
    
    MyLog(@"selectedSegmentIndex:%ld",(long)sender.selectedSegmentIndex);
    switch (sender.selectedSegmentIndex) {
        case 0:
            [[MyHUDView sharedInstance]show];
            break;
        case 1:
            [[MyHUDView sharedInstance]hide];
            break;
        case 2:
            
            break;
            
        default:
            break;
    }
    
}

- (IBAction)BtnAction:(UIButton *)sender {
    
}

/**************************类型一********************************/



@end
