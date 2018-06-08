//
//  GPUImageViewController.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2018/6/6.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

#import "GPUImageViewController.h"
#import <GPUImage/GPUImage.h>

@interface GPUImageViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation GPUImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

//@拉升变形镜滤镜
- (void)stretchAction {
    //创造输入源
    GPUImagePicture* gpupicture = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:@"sheep.jpeg"]];
    //创建滤镜
    GPUImageStretchDistortionFilter* stretchDistortionFilter = [GPUImageStretchDistortionFilter new];
    //为滤镜赋值
    stretchDistortionFilter.center=CGPointMake(0.5,0.5);
    //将输入源和滤镜绑定
    [gpupicture addTarget:stretchDistortionFilter];
    //为原图附上滤镜效果
    [gpupicture processImage];
    //滤镜收到原图产生的一个frame，并将它作为自己的当前图像缓存
    [stretchDistortionFilter useNextFrameForImageCapture];
    //通过滤镜，获取当前的图像。
    UIImage*image = [stretchDistortionFilter imageFromCurrentFramebuffer];
    
    self.imageView.image = image;
}

- (void)compoundFilterImage {
    
}

@end
