//
//  InterfaceTemplate.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/12/18.
//  Copyright © 2017年 zhoufei. All rights reserved.
//  海外购

#import <Foundation/Foundation.h>

//  model接口
@protocol AbroadShoppingHomeModelInterface <NSObject>

/**
 * 仅用来保持PB不为空
 */
@property(nonatomic) NSInteger status ;
/**
 * 广告位
 */
@property(nonatomic,strong) NSMutableArray * banners ;
/**
 * 四个icon
 */
@property(nonatomic,strong) NSMutableArray * shortCutIcons ;
/**
 * 促销时间戳，活动剩余时间,转换成毫秒
 */
@property(nonatomic,strong) NSString * remainingTime ;
/**
 * 倒计时的商品，客户端根据当该字段有的时候，展示“今日剁手价”图片
 */
@property(nonatomic,strong) NSMutableArray * salesGoods ;
/**
 * 全球精选商品集合
 */
@property(nonatomic,strong) NSMutableArray * selectGoods ;

@property (nonatomic,assign,getter=isLoaded) BOOL loaded;
@property (nonatomic,assign,getter=isReload) BOOL reload;

@end


//  viewModel接口
@protocol AbroadShoppingHomeViewModelInterface <NSObject>

@optional
@property (nonatomic,strong) id<AbroadShoppingHomeModelInterface> model;

@optional
- (void)initializeWithModel:(id<AbroadShoppingHomeModelInterface>)model completion:(void(^)())completion;
/**
 *立即购买
 * @para goodsId 这里Android就去调用CommonUtils里面的方法即可。IOS这里自行添加相应的代码。注意这里保持一个逻辑：如果是处方药进入到商品详情页，隐形眼镜…..
 */

- (void)senderAddShoppingCartWithModel:(id<AbroadShoppingHomeModelInterface>)model goodsId:(NSString *)goodsId completion:(void(^)())completion;
/**
 *获取海外购首页
 */

- (void)senderAbroadShoppingHomeWithModel:(id<AbroadShoppingHomeModelInterface>)model completion:(void(^)())completion;

@end

//  view接口
@protocol AbroadShoppingHomeViewInterface <NSObject>

@property (nonatomic,strong) id<AbroadShoppingHomeViewModelInterface> abroadshoppinghomeViewModel;
@property (nonatomic,strong) id<AbroadShoppingHomeViewModelInterface> abroadshoppinghomeOperator;


@end
