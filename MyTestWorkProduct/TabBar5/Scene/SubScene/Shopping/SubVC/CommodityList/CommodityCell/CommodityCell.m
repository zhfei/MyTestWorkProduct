//
//  CommodityCell.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/25.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "CommodityCell.h"
#import "AmountEditView.h"
#import <Masonry/Masonry.h>
//#import "ShoppingCartAnimation.m"
#import "ShoppingCartBar.h"

@interface CommodityCell ()
@property (weak, nonatomic) IBOutlet UILabel *commodityName;
@property (weak, nonatomic) IBOutlet UILabel *unit;
@property (weak, nonatomic) IBOutlet UILabel *Inventory;
@property (strong, nonatomic) AmountEditView * amountEditView;

@end


@implementation CommodityCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    AmountEditView * amountEditView = [AmountEditView amountEditView];
    self.amountEditView = amountEditView;
    [self addSubview:amountEditView];
    [amountEditView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.right.mas_equalTo(0);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(40);
    }];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
//    [[ShoppingCartAnimation sharedShoppingCartAnimation] arcMoveFromView:self.amountEditView toView:[ShoppingCartBar sharedShoppingCartBar]];

    // Configure the view for the selected state
}

@end
