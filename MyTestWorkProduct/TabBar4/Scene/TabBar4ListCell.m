//
//  TabBar4ListCell.m
//  MyTestWorkProduct
//
//  Created by 周飞 on 2018/9/20.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

#import "TabBar4ListCell.h"

@implementation TabBar4ListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setImageName:(NSString *)imageName {
    _imageName = imageName;
    self.flag.image = [UIImage imageNamed:imageName];
}

@end
