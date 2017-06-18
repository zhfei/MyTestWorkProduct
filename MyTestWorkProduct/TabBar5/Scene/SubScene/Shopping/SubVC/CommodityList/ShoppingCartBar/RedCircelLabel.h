//
//  RedCircelLabel.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/6/5.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RedCircelLabel : UIView
@property (strong,nonatomic)NSString * text;
@property (assign,nonatomic)CGRect     lableFrame;
+ (instancetype)redCircelLabel;


- (void)resetViewWithFrame:(CGRect)frame ;
@end
