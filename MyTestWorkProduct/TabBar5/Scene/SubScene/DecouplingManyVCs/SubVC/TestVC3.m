//
//  TestVC3.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/24.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "TestVC3.h"

@interface TestVC3 ()

@end

@implementation TestVC3

+ (TestVC3 *)testVC3WithChannelId:(NSString *)channelId {
    
    TestVC3 * testVC3 = [TestVC3 new];
    testVC3.channelId = channelId;
    
    return testVC3;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"TestVC3";
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
    
    return [TestVC3 testVC3WithChannelId:parametes];
}

@end
