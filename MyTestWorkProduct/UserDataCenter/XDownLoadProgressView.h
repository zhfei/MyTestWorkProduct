//
//  XDownLoadProgressView.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/3/1.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XDownLoadProgressView : UIView
@property (copy,nonatomic)void(^DownLoadProgressCancleBlock)();
@property (copy,nonatomic)void(^DownLoadProgressPauseOrRestartBlock)(BOOL isSelected);

+(instancetype)sharedInstance;
- (void)setProgress:(CGFloat)progress;
@end
