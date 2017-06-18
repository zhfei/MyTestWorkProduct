//
//  ZFButtonViewController.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/6/18.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "ZFButtonViewController.h"
#import "ZFButton.h"

@interface ZFButtonViewController ()

@property (weak, nonatomic) IBOutlet ZFButton *centerImageCenterTitleBtn;
@property (weak, nonatomic) IBOutlet ZFButton *rightImageLeftTitle;
@property (weak, nonatomic) IBOutlet ZFButton *leftImageNoneTitle;


@end

@implementation ZFButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
}

- (void)viewDidLayoutSubviews {

    [super viewDidLayoutSubviews];
    
    [self.centerImageCenterTitleBtn updateButtonStyleWithType:ZFButtonTypeCenterImageCenterTitle];
    [self.rightImageLeftTitle updateButtonStyleWithType:ZFButtonTypeRightImageLeftTitle];
    [self.leftImageNoneTitle updateButtonStyleWithType:ZFButtonTypeLeftImageNoneTitle];

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

@end
