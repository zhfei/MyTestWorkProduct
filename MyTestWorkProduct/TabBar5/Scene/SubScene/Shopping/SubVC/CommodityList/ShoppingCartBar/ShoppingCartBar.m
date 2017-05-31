//
//  ShoppingCartBar.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/26.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "ShoppingCartBar.h"

@implementation ShoppingCartBar

+ (ShoppingCartBar*)sharedShoppingCartBar {

    static ShoppingCartBar *shoppingCartBar;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shoppingCartBar = [ShoppingCartBar shoppingCartBar];
    });
    
    return shoppingCartBar;
}

+ (ShoppingCartBar*)shoppingCartBar {

   id obj = [[NSBundle mainBundle] loadNibNamed:@"ShoppingCartBar" owner:nil options:nil][0];
    
    return obj;
}

@end
