//
//  AbroadShoppingHomeHeaderView.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/12/18.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InterfaceTemplate.h"

@interface AbroadShoppingHomeHeaderView : UIView<AbroadShoppingHomeViewInterface>
@property (nonatomic,strong) id<AbroadShoppingHomeModelInterface> model;

@end
