//
//  OC_Swift_C_C++_VC.m
//  MyTestWorkProduct
//
//  Created by 周飞 on 18/4/22.
//  Copyright © 2018年 zhoufei. All rights reserved.
//
//  .m文件完全兼容C语言方法
//  .mm文件完全兼容C/C++语言方法

#import "OC_Swift_C_C++_VC.h"
#import "CppViewController.h"
#include "aa.h"

@interface OC_Swift_C_C___VC ()

@end

@implementation OC_Swift_C_C___VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

//OC调用C方法
- (void)ocCallC{
    //方式一，直接调用C函数
    printf("hello C\n");
    //方式二，通过调用引入C类
    NSLog(@"%d",sum(1, 2));
}

//OC调用C++方法
- (void)ocCallCpp{
    
    [CppViewController ocCallCpp];
}


@end
