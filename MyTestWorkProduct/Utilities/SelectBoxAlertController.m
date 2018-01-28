//
//  SelectBoxAlertController.m
//  BlueCat
//
//  Created by zhoufei on 16/10/10.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "SelectBoxAlertController.h"
#import <Masonry/Masonry.h>

typedef void(^BtnClickBlock)();


@interface SelectBoxAlertController()

@property (copy,nonatomic)BtnClickBlock makeSureBlock;

@property (copy,nonatomic)BtnClickBlock cancleBlock;

@property (copy,nonatomic)void(^SelectBoxClickBlock)(BOOL);

@property (strong,nonatomic)UIButton *selectBoxBtn;
@end

@implementation SelectBoxAlertController

/*!
 *  @author zhoufei
 *
 *  @brief 带有单选框的AlertController
 *  @param block1  “确定”block
 *  @param block2  “取消”block
 *  @param block3 “单选框勾选状态”block
 *  @return 实例
 */
+ (SelectBoxAlertController*)selectBoxAlertControllerWithMakeSureBlock:(void(^)())block1 cancleBlock:(void(^)())block2 selectBoxBlock:(void(^)(BOOL))block3{
    
    SelectBoxAlertController *alertVC= [SelectBoxAlertController alertControllerWithTitle:@"还未完成新手引导\n确认跳过？" message:@"\n" preferredStyle:UIAlertControllerStyleAlert];
        alertVC.makeSureBlock=block1;
        alertVC.cancleBlock=block2;
        alertVC.SelectBoxClickBlock=block3;
        
        [alertVC resetContentViews];
    
    return alertVC;
}

- (void)resetContentViews{

    //单选框
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [btn setAdjustsImageWhenHighlighted:NO];
    [btn setTitle:@"不再显示引导" forState:UIControlStateNormal];
    [btn setSelected:1];
    [btn setImage:[UIImage imageNamed:@"checkbox_click"] forState:UIControlStateSelected];
    [btn setImage:[UIImage imageNamed:@"checkbox_normal"] forState:UIControlStateNormal];
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 7, 0, 0)];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 7)];
    [btn addTarget:self action:@selector(selectBoxClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.centerY.mas_equalTo(self.view.mas_centerY).with.mas_offset(10);
        make.width.mas_equalTo(self.view.mas_width).multipliedBy(0.5);
        make.height.mas_equalTo(30);
    }];
    
    //取消
    [self addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (self.cancleBlock) {
            self.cancleBlock();
        }
        
    }]];
    
    //确定
    [self addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (self.makeSureBlock) {
            self.makeSureBlock();
        }
        
    }]];

}

- (void)selectBoxClick:(UIButton *)btn{

    btn.selected=!btn.selected;
    if (self.SelectBoxClickBlock) {
        self.SelectBoxClickBlock(btn.selected);
    }
}

+ (UIAlertController *)alertViewController:(NSString *)title {

    UIAlertController *alertVC= [UIAlertController alertControllerWithTitle:nil message:title preferredStyle:UIAlertControllerStyleAlert];
    
    //确定
    [alertVC addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

    }]];
    
    return alertVC;
}

@end
