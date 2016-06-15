//
//  CollectionViewHeaderCell.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/6/6.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "CollectionViewHeaderCell.h"
#import "UIImage+YYAdditions.h"

@implementation CollectionViewHeaderCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *btn =[UIButton new];
        self.btn=btn;
        [self.contentView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsZero);
        }];
        
        btn.titleLabel.font=[UIFont systemFontOfSize:16];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [btn setBackgroundImage:[UIImage resizedImageWithName:@"choose_framework_icon"] forState:UIControlStateNormal];
    }
    return self;
}
@end
