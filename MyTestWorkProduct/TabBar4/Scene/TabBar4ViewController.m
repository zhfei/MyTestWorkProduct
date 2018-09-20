//
//  TabBar4ViewController.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 15/11/3.
//  Copyright © 2015年 zhoufei. All rights reserved.
//

#import "TabBar4ViewController.h"
#import "UIButton+RACCommandSupport.h"
#import "UIControl+RACSignalSupport.h"
#import "RACCommand.h"
#import "RACSignal.h"
#import <WebKit/WebKit.h>
#import <JavaScriptCore/JavaScriptCore.h>
#import "UserLoginInfo.h"
#import "Masonry.h"

#import "XDownLoadOriginalManager.h"
#import "XZipProductsFileManager.h"

@interface TabBar4ViewController ()

@end

@implementation TabBar4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.tabBarItem.title=@"算法";
    
    
}

- (IBAction)TabBar4ViewControllerUnwindSegun:(UIStoryboardSegue *)unwindSegue {
    
}

@end
