//
//  ViewController.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 15/11/2.
//  Copyright © 2015年 zhoufei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 存储扩展数据（少量数据时）
    [[[NSUserDefaults alloc] initWithSuiteName:@"group.com.xkc.MyTestWorkProduct"] setValue:@"110" forKey:@"myShareData"];
    // 创建一个共享文件夹（大量数据时，里面可以放realm,SQLite）
    NSURL *groupURL = [[NSFileManager defaultManager]  containerURLForSecurityApplicationGroupIdentifier: @"group.com.xkc.MyTestWorkProduct"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
