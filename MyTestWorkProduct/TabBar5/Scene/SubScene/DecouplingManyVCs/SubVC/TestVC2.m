//
//  TestVC2.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/24.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "TestVC2.h"

@interface TestVC2 ()

@end

@implementation TestVC2

+ (TestVC2 *)testVC2WithChannelId:(NSString *)channelId {
    
    TestVC2 * testVC2 = [TestVC2 new];
    testVC2.channelId = channelId;
    
    return testVC2;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"TestVC2";
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

+ (BOOL)eventCheckParametesAvaliable:(id)parametes {
    
    if (parametes && [parametes isEqualToString:@"123"]) {
        return YES;
    }
    
    return NO;
}

+ (id)eventNewObjectWithParametes:(id)parametes {
    
    return [TestVC2 testVC2WithChannelId:parametes];
}

@end
