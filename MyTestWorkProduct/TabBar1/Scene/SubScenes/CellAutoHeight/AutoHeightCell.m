//
//  AutoHeightCell.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/4/7.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "AutoHeightCell.h"
#import "Masonry.h"

@interface AutoHeightCell ()

@end

@implementation AutoHeightCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubViews];
    }
    
    return self;
}

- (void)createSubViews
{
    UILabel *contentLabel =[[UILabel alloc]init];
    [self.contentView addSubview:contentLabel];
    contentLabel.numberOfLines=2;
    contentLabel.font=[UIFont systemFontOfSize:18];
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 20, 0, 20));
    }];
    
    self.contentLabel=contentLabel;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setContentString:(NSString *)contentString
{
    _contentString=contentString;
    

    self.contentLabel.text=contentString;
}

@end
