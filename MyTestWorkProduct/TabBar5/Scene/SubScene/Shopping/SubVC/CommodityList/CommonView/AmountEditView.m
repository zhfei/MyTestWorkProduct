//
//  AmountEditView.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/25.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "AmountEditView.h"
#import <Masonry/Masonry.h>

static CGFloat kBtnWidth = 20;

@interface AmountEditView()
@property (strong,nonatomic)UILabel * amountLable;
@property (strong,nonatomic)UIButton * minusBtn;
@property (strong,nonatomic)UIButton * plusBtn;

@property (assign,nonatomic)NSInteger amountValue;
@end

@implementation AmountEditView

+ (AmountEditView *)amountEditView {

    AmountEditView * amountEditView = [AmountEditView new];
    [amountEditView resetSubView];
    amountEditView.amountValue = amountEditView.amountLable.text.integerValue;
    
    return amountEditView;
}

- (void)resetSubView {

    UIButton * plusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [plusBtn setTitle:@"加" forState:UIControlStateNormal];
    [plusBtn setBackgroundColor:[UIColor blueColor]];
    [plusBtn addTarget:self action:@selector(plusAmount:) forControlEvents:UIControlEventTouchUpInside];
    self.plusBtn = plusBtn;
    [self addSubview:plusBtn];
    [plusBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(kBtnWidth, kBtnWidth));
    }];
    
    UIButton * minusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [minusBtn setTitle:@"减" forState:UIControlStateNormal];
    [minusBtn setBackgroundColor:[UIColor purpleColor]];
    [minusBtn addTarget:self action:@selector(minusAmount:) forControlEvents:UIControlEventTouchUpInside];
    self.minusBtn = minusBtn;
    [self addSubview:minusBtn];
    [minusBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(kBtnWidth, kBtnWidth));
    }];
    
    UILabel * amountLable = [UILabel new];
    amountLable.textAlignment = NSTextAlignmentCenter;
    self.amountLable = amountLable;
    [self addSubview:amountLable];
    [amountLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(plusBtn.mas_right);
        make.right.equalTo(minusBtn.mas_left);
        make.top.equalTo(plusBtn.mas_top);
        make.height.mas_equalTo(kBtnWidth);
    }];
    
}


- (void)plusAmount:(UIButton *)sender {
    
    self.minusBtn.enabled = YES;
    if (_amountValue >= CGFLOAT_MAX) {
        return;
    }
    
    self.amountValue++;
    self.amountLable.text = [NSString stringWithFormat:@"%d",self.amountValue];
    
    self.plusBtn.enabled = (_amountValue < CGFLOAT_MAX);
}

- (void)minusAmount:(UIButton *)sender {
    
    self.plusBtn.enabled = YES;
    if (_amountValue <= 0) {
        return;
    }
    
    self.amountValue--;
    self.amountLable.text = [NSString stringWithFormat:@"%d",self.amountValue];
    
    self.minusBtn.enabled = (_amountValue > 0);
}

- (void)updateAmountLabelView {

    
}


@end
