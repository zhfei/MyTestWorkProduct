//
//  StoryBoardVC2.m
//  MyTestWorkProduct
//
//  Created by 周飞 on 18/4/17.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

#import "StoryBoardVC2.h"

@interface StoryBoardVC2 ()

- (IBAction)goBack:(id)sender;
@end

@implementation StoryBoardVC2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self testArray1];
}

- (void)testArray1 {

    NSArray *array1 = @[@"1",@"2",@"3",@"4"];
    NSInteger index = 1;
    NSLog(@"target:%@",array1[index++]);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)goBack:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
