//
//  BlurEffectViewController.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/5/28.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "BlurEffectViewController.h"
#import "Masonry.h"
#import "Utilities.h"

@implementation BlurEffectViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.hidesBottomBarWhenPushed=YES;
    
    UIImageView *imageV =[[UIImageView alloc]init];
    imageV.contentMode=UIViewContentModeScaleToFill;
    [self.view addSubview:imageV];
    [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *image = [CIImage imageWithContentsOfURL:[NSURL URLWithString: [Utilities pathInBundleWithImageName:@"user_header_bg"]
]];
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:image forKey:kCIInputImageKey];
    [filter setValue:@2.0f forKey: @"inputRadius"];
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    CGImageRef outImage = [context createCGImage: result fromRect:[result extent]];
    UIImage * blurImage = [UIImage imageWithCGImage:outImage];
    
    [imageV setImage:blurImage];
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

@end
