//
//  MyHUDView.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/1/8.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyHUDView : UIView
- (instancetype)sharedInstance;
+ (instancetype)sharedInstance;

- (void)show;
- (void)hide;

@end
