//
//  AbroadShoppingHomePresenter.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/12/18.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InterfaceTemplate.h"

@interface AbroadShoppingHomePresenter : NSObject
- (void)adapterWithAbroadShoppingHomeView:(id<AbroadShoppingHomeViewInterface>)abroadshoppinghomeView abroadshoppinghomeViewModel:(id<AbroadShoppingHomeViewModelInterface>)abroadshoppinghomeViewModel;

@end
