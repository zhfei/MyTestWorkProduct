//
//  XDownLoadProgressView.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/3/1.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "XDownLoadProgressView.h"
#import "Masonry.h"

@interface XDownLoadProgressView()
{
    UIProgressView *_currentProgressView;
    UILabel        *_progressLabel;
    
    UIButton       *_cancleBtn;
    UIButton       *_pauseOrReStartBtn;
}
@end

@implementation XDownLoadProgressView
+(instancetype)sharedInstance
{
    static XDownLoadProgressView *__singleOne__;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        __singleOne__=[[[self class]alloc]init];
    });
    
    return __singleOne__;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self ininProgressSubView];
    }
    return self;
}


- (void)ininProgressSubView
{
    
    UIBlurEffect * blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView * effectView = [[UIVisualEffectView alloc]initWithEffect:blur];
    [self addSubview:effectView];
    [effectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    
    _currentProgressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
    _currentProgressView.trackTintColor=[UIColor brownColor];
    _currentProgressView.progressTintColor=[UIColor redColor];
    
    [effectView addSubview:_currentProgressView];
    
    __weak typeof(self)weakSelf =self;
    [_currentProgressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(weakSelf.mas_width).multipliedBy(0.6);
        make.height.mas_equalTo(@(20));
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.centerY.equalTo(weakSelf.mas_centerY);
    }];
    
    UILabel *title =[[UILabel alloc]init];
    [effectView addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_currentProgressView.mas_left);
        make.height.mas_equalTo(@(50));
        make.width.equalTo(_currentProgressView.mas_width).multipliedBy(0.5);
        make.top.equalTo(_currentProgressView.mas_bottom);
    }];
    title.text=@"下载进度：";
    
    UILabel *progressLabel =[[UILabel alloc]init];
    [effectView addSubview:progressLabel];
    [progressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(title.mas_right);
        make.height.mas_equalTo(title.mas_height);
        make.width.equalTo(title.mas_width);
        make.top.equalTo(title.mas_top);
    }];
    progressLabel.text=@"0.00％";
    _progressLabel=progressLabel;
    
    UIButton *cancleBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [effectView addSubview:cancleBtn];
    [cancleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(title.mas_left);
        make.top.equalTo(title.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(100, 50));
    }];
    cancleBtn.tag=501;
    [cancleBtn addTarget:self action:@selector(ButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    _cancleBtn=cancleBtn;
    
    UIButton *pauseOrReStartBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [pauseOrReStartBtn setTitle:@"暂停" forState:UIControlStateNormal];
    [pauseOrReStartBtn setTitle:@"开始" forState:UIControlStateSelected];
    [pauseOrReStartBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [effectView addSubview:pauseOrReStartBtn];
    [pauseOrReStartBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(progressLabel.mas_right);
        make.top.equalTo(cancleBtn.mas_top);
        make.size.mas_equalTo(CGSizeMake(100, 50));
    }];
    pauseOrReStartBtn.tag=502;
   [pauseOrReStartBtn addTarget:self action:@selector(ButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    _pauseOrReStartBtn=pauseOrReStartBtn;
    
}

- (void)setProgress:(CGFloat)progress
{
    [_currentProgressView setProgress:progress];
    _progressLabel.text=[NSString stringWithFormat:@"%.2f ％",progress*100];
}

- (void)ButtonClick:(UIButton *)btn
{
    if (btn.tag==501) {
        if (self.DownLoadProgressCancleBlock) {
            self.DownLoadProgressCancleBlock();
        }
    }else if (btn.tag==502){
        
        btn.selected=!btn.selected;
       
        if (self.DownLoadProgressPauseOrRestartBlock) {
            self.DownLoadProgressPauseOrRestartBlock(btn.selected);
        }
    }
}

- (void)removeFromSuperview
{
    [super removeFromSuperview];
    _pauseOrReStartBtn.selected=NO;
    _cancleBtn.selected=NO;
}

@end
