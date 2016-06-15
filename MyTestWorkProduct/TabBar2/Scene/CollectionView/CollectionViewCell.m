//
//  CollectionViewCell.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/6/2.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "CollectionViewCell.h"
#import "Masonry.h"

@implementation CollectionViewCell
- (instancetype)init
{
    self = [super init];
    if (self) {
        UILabel *label =[UILabel new];
        self.label=label;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsZero);
        }];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        UILabel *label =[UILabel new];
        self.label=label;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsZero);
        }];
    }
    return self;
}

-(void)awakeFromNib
{
    UILabel *label =[UILabel new];
    self.label=label;
    [self.contentView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *label =[UILabel new];
        self.label=label;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsZero);
        }];
        [label setAdjustsFontSizeToFitWidth:YES];
    }
    return self;
}


@end
