//
//  ShoppingCartBar.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/26.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShoppingCartBar : UIView
@property (weak, nonatomic) IBOutlet UIImageView *imageFlag;

+ (ShoppingCartBar*)sharedShoppingCartBar;

@end
