//
//  LeftEdgeCollectionViewCell.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/7/26.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "LeftEdgeCollectionViewCell.h"
#import "UIColor+Hexadecimal.h"
#import "Masonry.h"

@interface LeftEdgeCollectionViewCell ()

@property (strong,nonatomic)UILabel*label;
@end


@implementation LeftEdgeCollectionViewCell

- (void)setTitle:(NSString *)title
{
    _title=title;
    [[self label] setText:title];
    
    [[self label] setTextColor:[UIColor randomColor]];
    [[self label] setBackgroundColor:[UIColor randomColor]];
}

- (UILabel *)label
{
    if (_label==nil) {
        UILabel *label=[[UILabel alloc]init];
        label.textAlignment=NSTextAlignmentCenter;
        label.numberOfLines=0;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsZero);
        }];
        _label=label;
    }
    return _label;

}

@end
