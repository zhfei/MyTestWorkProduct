//
//  AbroadShoppingHomePresenter.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/12/18.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "AbroadShoppingHomePresenter.h"


@interface AbroadShoppingHomePresenter ()

@property (nonatomic,weak) id<AbroadShoppingHomeViewInterface> abroadshoppinghomeView;
@property (nonatomic,weak) id<AbroadShoppingHomeViewModelInterface> abroadshoppinghomeViewModel;

@end

@implementation AbroadShoppingHomePresenter

- (void)adapterWithAbroadShoppingHomeView:(id<AbroadShoppingHomeViewInterface>)abroadshoppinghomeView abroadshoppinghomeViewModel:(id<AbroadShoppingHomeViewModelInterface>)abroadshoppinghomeViewModel {
    
    _abroadshoppinghomeView = abroadshoppinghomeView;
    _abroadshoppinghomeViewModel = abroadshoppinghomeViewModel;
    
    __weak typeof(self) _self = self;
    __weak id<AbroadShoppingHomeViewModelInterface> __abroadshoppinghomeViewModel = _abroadshoppinghomeViewModel;
    [_abroadshoppinghomeViewModel initializeWithModel:__abroadshoppinghomeViewModel.model completion:^{
        _self.abroadshoppinghomeView.abroadshoppinghomeViewModel = __abroadshoppinghomeViewModel;
        _self.abroadshoppinghomeView.abroadshoppinghomeOperator = _self;
    }];
}

/**
 *立即购买
 * @para goodsId 这里Android就去调用CommonUtils里面的方法即可。IOS这里自行添加相应的代码。注意这里保持一个逻辑：如果是处方药进入到商品详情页，隐形眼镜…..
 */

- (void)senderAddShoppingCartWithModel:(id<AbroadShoppingHomeModelInterface>)model goodsId:(NSString *)goodsId completion:(void(^)())completion {
    
    __weak typeof(self) _self = self;
    __weak id<AbroadShoppingHomeViewModelInterface> __abroadshoppinghomeViewModel = _abroadshoppinghomeViewModel;
    [_abroadshoppinghomeViewModel senderAddShoppingCartWithModel:model goodsId:goodsId completion:^{
        _self.abroadshoppinghomeView.abroadshoppinghomeViewModel = __abroadshoppinghomeViewModel;
        completion();
    }];
}

/**
 *获取海外购首页
 */

- (void)senderAbroadShoppingHomeWithModel:(id<AbroadShoppingHomeModelInterface>)model completion:(void(^)())completion {
    
    __weak typeof(self) _self = self;
    __weak id<AbroadShoppingHomeViewModelInterface> __abroadshoppinghomeViewModel = _abroadshoppinghomeViewModel;
    [_abroadshoppinghomeViewModel senderAbroadShoppingHomeWithModel:model completion:^{
        _self.abroadshoppinghomeView.abroadshoppinghomeViewModel = __abroadshoppinghomeViewModel;
        completion();
    }];
}

@end
