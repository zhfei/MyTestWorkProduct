//
//  MyHUDView.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/1/8.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "MyHUDView.h"

@interface MyHUDView()
@property (strong,nonatomic)MyHUDView *hudView;
@end

@implementation MyHUDView


- (instancetype)sharedInstance
{
  return [MyHUDView sharedInstance];
}
+ (instancetype)sharedInstance
{
    static dispatch_once_t once;
    static MyHUDView * __singleton__;
    dispatch_once( &once, ^{
        __singleton__ = [[[self class] alloc] init];
    } );
    
    return __singleton__;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


- (void)show{
    [self setBackgroundColor:[UIColor colorWithWhite:0 alpha:1]];
    
    self.layer.borderWidth=2.f;
    self.layer.cornerRadius=5.f;
    self.layer.masksToBounds=YES;
    
   
    UIWindow *window= [[UIApplication sharedApplication].windows firstObject];
     [window addSubview:self];
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(window);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
//    [self setBounds:CGRectMake(0, 0, 100, 100)];
//    [self setCenter:CGPointMake(ScreenWidth/2, ScreenHight/2)];

    
}

- (void)hide{
    [self removeFromSuperview];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}


@end
