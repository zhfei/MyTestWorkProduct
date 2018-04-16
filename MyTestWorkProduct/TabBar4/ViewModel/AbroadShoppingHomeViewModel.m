//
//  AbroadShoppingHomeViewModel.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/12/18.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "AbroadShoppingHomeViewModel.h"
#import "AbroadShoppingHomeModel.h"

@interface AbroadShoppingHomeViewModel ()
@property (nonatomic, strong)AbroadShoppingHomeModel *model;
@end

@implementation AbroadShoppingHomeViewModel
- (AbroadShoppingHomeModel *)model {
    
    if (!_model) {
        _model = [AbroadShoppingHomeModel new];
    }
    return _model;
}

- (void)initializeWithModel:(id<AbroadShoppingHomeModelInterface>)model completion:(void(^)())completion {
    if (!model.isLoaded) {
        [self senderAbroadShoppingHomeWithModel:model completion:completion];
    }
}

/**
 *立即购买
 * @para goodsId 这里Android就去调用CommonUtils里面的方法即可。IOS这里自行添加相应的代码。注意这里保持一个逻辑：如果是处方药进入到商品详情页，隐形眼镜…..
 */

- (void)senderAddShoppingCartWithModel:(id<AbroadShoppingHomeModelInterface>)model goodsId:(NSString *)goodsId completion:(void(^)())completion {
    
}

/**
 *获取海外购首页
 */

- (void)senderAbroadShoppingHomeWithModel:(id<AbroadShoppingHomeModelInterface>)model completion:(void(^)())completion {
   
}

@end
