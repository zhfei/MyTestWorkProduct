//
//  ClassifyCell.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/25.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "ClassifyCell.h"

@interface ClassifyCell ()

@end

@implementation ClassifyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    self.title.backgroundColor = selected?[UIColor whiteColor]:[UIColor lightGrayColor];
    // Configure the view for the selected state
}

@end
