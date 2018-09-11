//
//  QRCodeScanViewController.m
//  MyTestWorkProduct
//
//  Created by 周飞 on 2018/9/10.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

#import "QRCodeScanViewController.h"
#import <AVFoundation/AVFoundation.h>

typedef void(^ScanResultBlock)(NSString *result);

@interface QRCodeScanViewController ()<AVCaptureMetadataOutputObjectsDelegate,CAAnimationDelegate>
@property (strong, nonatomic)AVCaptureSession *captureSession;
@property (strong, nonatomic)AVCaptureVideoPreviewLayer *videoPreviewLayer;
@property (strong, nonatomic)UIView *boxView;
@property (strong, nonatomic)UIView *viewPreview;
@property (strong, nonatomic)CALayer *scanLayer;
@property (strong, nonatomic)NSTimer *timer;
@property (assign, nonatomic)BOOL isReading;
@property (copy, nonatomic)ScanResultBlock resultBlock;
@property (strong, nonatomic)CABasicAnimation * animation;
@end

@implementation QRCodeScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _viewPreview = self.view;
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (granted) {
                //配置扫描view
                [self loadScanView];
            } else {
                NSString *title = @"请在iPhone的”设置-隐私-相机“选项中，允许App访问你的相机";
                 [self showAlertWithTitle:title];
            }
        });
    }];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self stopRunning];
}

- (void)loadScanView {
    //1.初始化捕捉设备（AVCaptureDevice），类型为AVMediaTypeVideo
    AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    //2.用captureDevice创建输入流
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:captureDevice error:nil];
    //3.创建媒体数据输出流
    AVCaptureMetadataOutput *output = [[AVCaptureMetadataOutput alloc] init];
    //4.实例化捕捉会话
    _captureSession = [[AVCaptureSession alloc] init];
    //4.1.将输入流添加到会话
    [_captureSession addInput:input];
    //4.2.将媒体输出流添加到会话中
    [_captureSession addOutput:output];
    //5.设置代理 在主线程里刷新
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    //5.2.设置输出媒体数据类型为QRCode
    [output setMetadataObjectTypes:[NSArray arrayWithObject:AVMetadataObjectTypeQRCode]];
    //6.实例化预览图层
    _videoPreviewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:_captureSession];
    //7.设置预览图层填充方式
    [_videoPreviewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    //8.设置图层的frame
    [_videoPreviewLayer setFrame:_viewPreview.layer.bounds];
    //9.将图层添加到预览view的图层上
    [_viewPreview.layer addSublayer:_videoPreviewLayer];
    //10.1.扫描框
    CGFloat width = 218.0;
    CGFloat heigh = 238.0;
    CGFloat scaleWidth = width/[UIScreen mainScreen].bounds.size.width;
    CGFloat scaleHeigh = heigh/[UIScreen mainScreen].bounds.size.height;
    CGFloat scaleX = (1-(scaleWidth))*0.5;
    CGFloat scaleY = (1-(scaleHeigh))*0.5;
    _boxView = [[UIView alloc] initWithFrame:CGRectMake(_viewPreview.bounds.size.width * scaleX, _viewPreview.bounds.size.height*scaleY, _viewPreview.bounds.size.width - _viewPreview.bounds.size.width * scaleX*2, _viewPreview.bounds.size.height - _viewPreview.bounds.size.height * scaleY*2)];
    //10.设置扫描范围
    output.rectOfInterest = CGRectMake(0.2f, 0.2f, 0.8f, 0.8f);
    [_viewPreview addSubview:_boxView];
    
    _scanLayer = [[CALayer alloc] init];
    _scanLayer.frame = CGRectMake(0, 0, _boxView.bounds.size.width, 44);
    [_boxView.layer addSublayer:_scanLayer];
    _boxView.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"scanBorder"].CGImage);
    _scanLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"scan"].CGImage);
    
    [self setScanBorder];
    [self addTitleLabel];
    [self moveUpAndDownLine];
    [self startRunning];
}

//设置扫描框
- (void)setScanBorder {
    CAShapeLayer *bgShape = [CAShapeLayer new];
    UIBezierPath *bgBez = [UIBezierPath bezierPathWithRect:self.view.bounds];
    UIBezierPath *prBez = [UIBezierPath bezierPathWithRect:_boxView.frame];
    [bgBez appendPath:prBez];
    
    bgBez.usesEvenOddFillRule = YES;
    bgShape.path = bgBez.CGPath;
    bgShape.fillRule = kCAFillRuleEvenOdd;
    bgShape.opacity = 0.4;//透明度
    [_viewPreview.layer addSublayer:bgShape];
}

- (void)addTitleLabel {
    UILabel *title = [UILabel new];
    [title setFrame:CGRectMake(CGRectGetMinX(_boxView.frame)+7, CGRectGetMaxY(_boxView.frame)+10, _boxView.frame.size.width-7*2, 20)];
    title.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12.f];
    title.textAlignment = NSTextAlignmentCenter;
    title.text = @"将二维码放入框内，即可自动扫描";
    title.textColor = [UIColor whiteColor];
    title.layer.cornerRadius = 10;
    title.layer.masksToBounds = YES;
    title.backgroundColor = [UIColor colorWithRed:1/255.0 green:1/255.0 blue:1/255.0 alpha:0.4];
    [_viewPreview addSubview:title];
}

#pragma mark 开始
- (void)startRunning {
    if (self.captureSession) {
        self.isReading = YES;
        [self.captureSession startRunning];
        _timer=[NSTimer scheduledTimerWithTimeInterval:1.6 target:self selector:@selector(moveUpAndDownLine) userInfo:nil repeats: YES];
    }
}

- (void)moveUpAndDownLine {
    [self.scanLayer addAnimation:self.animation forKey:@"anim"]; // key 用来标识动画
}

#pragma mark - Getter、Setter
- (CABasicAnimation *)animation {
    if (!_animation) {
        CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"position"];
        [animation setDuration:1.5];
        // 设置delegate
        animation.delegate = self;
        // 动画结束后不删除动画，否则在回调中无法得到动画
        animation.removedOnCompletion = NO;
        // 设置动画不还原
        animation.fillMode = @"forwards";
        
        CGFloat positionX = self.scanLayer.bounds.size.width*0.5;
        CGFloat positionY1 =  _boxView.bounds.size.height - self.scanLayer.bounds.size.height*0.5;
        [animation setFromValue:[NSValue valueWithCGPoint:CGPointMake(positionX, 0)]];
        [animation setToValue:[NSValue valueWithCGPoint:CGPointMake(positionX, positionY1-1)]];
        
        _animation = animation;
    }
    return _animation;
}

- (void)showAlertWithTitle:(NSString*)title {
    //跟上面的流程差不多，记得要把preferredStyle换成UIAlertControllerStyleAlert
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
    
//    //可以给alertview中添加一个输入框
//    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
//        textField.placeholder = @"alert中的文本";
//    }];
//
//    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"标题1" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        NSLog(@"点击了按钮1，进入按钮1的事件");
//        //textFields是一个数组，获取所输入的字符串
//        NSLog(@"%@",alert.textFields.lastObject.text);
//    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了确定");
    }];
    
//    [alert addAction:action1];
    [alert addAction:action2];
    
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - CAAnimationDelegate
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if([self.scanLayer animationForKey:@"anim"] == anim) { // 根据上面的标识的key来判断动画
        NSLog(@"动画结束");
    }
}

#pragma mark - AVCaptureMetadataOutputObjectsDelegate
- (void)captureOutput:(AVCaptureOutput *)output didOutputMetadataObjects:(NSArray<__kindof AVMetadataObject *> *)metadataObjects fromConnection:(AVCaptureConnection *)connection {
    //判断是否有数据
    if (!_isReading) {
        return;
    }
    if (metadataObjects.count > 0) {
        _isReading = NO;
        AVMetadataMachineReadableCodeObject *metadataObject = metadataObjects[0];
        NSString *result = metadataObject.stringValue;
        NSLog(@"扫描结果：%@",result);
        if (self.resultBlock) {
            self.resultBlock(result?:@"");
        }
        [self.navigationController popViewControllerAnimated:NO];
    }
}

#pragma mark 结束
- (void)stopRunning {
    if ([_timer isValid]) {
        [_timer invalidate];
        _timer = nil ;
    }
    [self.captureSession stopRunning];
    [_scanLayer removeFromSuperlayer];
    [_videoPreviewLayer removeFromSuperlayer];
}

@end
