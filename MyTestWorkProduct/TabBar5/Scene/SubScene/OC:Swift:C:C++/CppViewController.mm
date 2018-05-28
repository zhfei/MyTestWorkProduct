//
//  CppViewController.m
//  MyTestWorkProduct
//
//  Created by 周飞 on 18/4/22.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

#import "CppViewController.h"
#include <iostream>

@interface CppViewController ()

@end

@implementation CppViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//OC调用C++方法
+ (void)ocCallCpp{
    
    std::cout<<"hello cpp\n";
}

@end
