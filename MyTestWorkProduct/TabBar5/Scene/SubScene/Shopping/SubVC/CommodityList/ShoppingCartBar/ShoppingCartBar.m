//
//  ShoppingCartBar.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/26.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "ShoppingCartBar.h"
#import "RedCircelLabel.h"

@implementation ShoppingCartBar

+ (ShoppingCartBar*)sharedShoppingCartBar {

//    static ShoppingCartBar *shoppingCartBar;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        shoppingCartBar = [ShoppingCartBar shoppingCartBar];
//        [shoppingCartBar resetSubView];
//    });
    
    ShoppingCartBar *shoppingCartBar;
    shoppingCartBar = [ShoppingCartBar shoppingCartBar];
    [shoppingCartBar resetSubView];
    
    return shoppingCartBar;
}

+ (ShoppingCartBar*)shoppingCartBar {

   id obj = [[NSBundle mainBundle] loadNibNamed:@"ShoppingCartBar" owner:nil options:nil][0];
    
    return obj;
}

- (void)resetSubView {

    RedCircelLabel * redCircelLabel = [RedCircelLabel redCircelLabel];
    [redCircelLabel setLableFrame:CGRectMake(0, 0, 30, 30)];
    [redCircelLabel resetViewWithFrame:CGRectMake(0, 0, 20, 20)];
    redCircelLabel.text = @"100";
    [self addSubview:redCircelLabel];
    
}

@end
