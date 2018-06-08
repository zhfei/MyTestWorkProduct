//
//  GPUImageViewController.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2018/6/6.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

#import "GPUImageViewController.h"
#import <GPUImage/GPUImage.h>

/**
 GPUImage提供了五种输入源类：GPUImagePicture、GPUImageRawDataInput、GPUImageMovie、GPUImageUIElement、GPUImageVideoCamera，
 通过名字即可知道应根据输入源类型应选择相应类进行输入源对象创建
 除了开头的输入源，结束的输出源，中间的过滤器都是遵守了输出协议和输入协议，以此来达到过滤器串行链接
 */

@interface GPUImageViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation GPUImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self compoundFilterImage];
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
// 复合滤镜
- (void)compoundFilterImage {
    //获取原图
    GPUImagePicture* gpupicture = [[GPUImagePicture alloc]initWithImage:[UIImage imageNamed:@"Duck"]];
    //输出图像的View
    GPUImageView* gpuimageView = [[GPUImageView alloc]initWithFrame:CGRectMake(0,60,320,320)];
//    [self.view addSubview:gpuimageView];
    //卡通描边滤镜
    GPUImageToonFilter* toonFilter = [GPUImageToonFilter new];
    toonFilter.threshold=0.1;
    //拉升变形滤镜
    GPUImageStretchDistortionFilter* stretchDistortionFilter = [GPUImageStretchDistortionFilter new];
    stretchDistortionFilter.center=CGPointMake(0.5,0.5);
    //将滤镜组成数组
    NSArray* filters = @[toonFilter,stretchDistortionFilter];
    //通过pipline，将输入源，输出，滤镜，三方绑定
    GPUImageFilterPipeline* pipLine = [[GPUImageFilterPipeline alloc]initWithOrderedFilters:filters input:gpupicture output:gpuimageView];
    //绘制产出最终带有复合滤镜的图像。
    [gpupicture processImage];
    //获取产出的UIImage图像
    //此时调用useNextFrameForImageCapture的可以是任一在数组中的Filter。
    [stretchDistortionFilter useNextFrameForImageCapture];
    UIImage* image = [pipLine currentFilteredFrame];
    
    self.imageView.image = image;
}

@end
