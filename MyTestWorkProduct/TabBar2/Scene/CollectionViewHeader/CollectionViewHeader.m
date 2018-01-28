//
//  CollectionViewHeader.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/6/6.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "CollectionViewHeader.h"

@interface CollectionViewHeader()
@property(strong,nonatomic)UILabel *categoryShowName;
@property(strong,nonatomic)UILabel *demandRemarkContent;
@property(strong,nonatomic)UIImageView *moreFlag;

@end

@implementation CollectionViewHeader
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self createSubViews];
    }
    return self;
}

- (void)createSubViews
{
    //左侧
    UILabel *categoryShowName=[UILabel new];
    categoryShowName.font=[UIFont systemFontOfSize:17];
    categoryShowName.textColor=[UIColor blackColor];
    [self addSubview:categoryShowName];
    [categoryShowName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.width.mas_equalTo(110);
    }];
    self.categoryShowName=categoryShowName;
    
    //右侧
    UIImageView * moreFlag=[UIImageView new];
    moreFlag.userInteractionEnabled=YES;
    moreFlag.contentMode=UIViewContentModeCenter;
    
    [self addSubview:moreFlag];
    [moreFlag mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.width.mas_equalTo(50);
    }];
    self.moreFlag=moreFlag;
    
    //中间
    UILabel *demandRemarkContent=[UILabel new];
    demandRemarkContent.font=[UIFont systemFontOfSize:17];
    demandRemarkContent.textColor=[UIColor lightGrayColor];
    demandRemarkContent.textAlignment=NSTextAlignmentRight;
    [self addSubview:demandRemarkContent];
    [demandRemarkContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(categoryShowName.mas_right);
        make.right.equalTo(moreFlag.mas_left);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    self.demandRemarkContent=demandRemarkContent;
    
    //设置背景色
    [self setBackgroundColor:[UIColor whiteColor]];
    self.categoryShowName.backgroundColor=[UIColor whiteColor];
    self.demandRemarkContent.backgroundColor=[UIColor whiteColor];
    self.moreFlag.backgroundColor=[UIColor whiteColor];
    
    //添加分割线
    UIView *link =[[UIView alloc]initWithFrame:CGRectMake(0, self.bounds.size.height-0.5, self.bounds.size.width, 0.5)];
    [link setBackgroundColor:RGBACOLOR(200, 199, 204, 1)];
    [self addSubview:link];
    
    self.categoryShowName.text=@"分类展示名";
    self.demandRemarkContent.text=@"要求备注内容";
    [self.moreFlag setImage:[UIImage imageNamed:@"editor_list_icon"]];
    
    
}

@end
