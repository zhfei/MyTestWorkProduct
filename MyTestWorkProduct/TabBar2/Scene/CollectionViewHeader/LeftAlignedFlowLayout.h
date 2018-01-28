//
//  LeftAlignedFlowLayout.h
//  Coffee
//
//  Created by zhoufei on 16/3/22.
//  Copyright © 2016年 XPay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftAlignedFlowLayout : UICollectionViewFlowLayout

/**
 *  配置布局
 *
 *  @param leftMargin 一行   距离左侧的距离
 *  @param ItemMargin 一行中 选项之间的距离
 */
- (void)configLeftAlignedFlowLayoutWithLeftMargin:(CGFloat)leftMargin ItemMargin:(CGFloat)ItemMargin;
@end
