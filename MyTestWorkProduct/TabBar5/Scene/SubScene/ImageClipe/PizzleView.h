//
//  PizzleView.h
//  ImageClipe
//
//  Created by 周飞 on 2018/5/28.
//  Copyright © 2018年 周飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PizzleView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

+ (instancetype)pizzleView;

- (void)setupView;

@end
