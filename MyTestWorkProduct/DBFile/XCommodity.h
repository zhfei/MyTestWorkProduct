//
//  XProducte.h
//  XPay
//
//  Created by jack zhou on 2/2/15.
//  Copyright (c) 2015 jack zhou. All rights reserved.
//

#import "XObject.h"
#import "XProduct.h"

@interface XCommodity : XProduct
@property (nonatomic, copy  ) NSString   *commodityID;// 商品ID
@property (nonatomic, copy  ) NSString   *type;// 计价类型
@property (nonatomic, copy  ) NSString   *commodityName;// 商品名字
@property (nonatomic, copy  ) NSString   *unit;// 单位("杯"，"斤")
@property (nonatomic, copy  ) NSString   *printID;
@property (nonatomic, assign) CGFloat    price;// 商品价格
@property (nonatomic, assign) BOOL       isWeight;//计重类型

//quantity：数量（1.当商品是普通商品时，和goodsNum等价，2.当商品是套餐时，表示套餐中 子商品的配置个数）
@property (nonatomic,assign ) double     quantity;
@property (nonatomic,assign ) CGFloat    canceledQuantity;//退菜个数
@property (nonatomic,assign ) double     amount;//总价

@property (nonatomic, assign) BOOL       marketable;// 代码中没有使用的地方
@property (nonatomic, assign) BOOL       isSelected;
@property (nonatomic, assign) NSUInteger sequence;// 排序编号
@property (nonatomic, copy  ) NSString   *commodityNumber;//商品编号
@property (nonatomic, copy  ) NSString   *barcode;//商品条码

//新增加的属性
@property (nonatomic, copy  ) NSNumber   *inventory;//商品库存
@property (nonatomic, copy  ) NSString   *unitType;//商品单位类别
@property (nonatomic, copy  ) NSString   *searchPinyin;//商品名称转拼音
@property (nonatomic, copy  ) NSNumber   *categoryId;//商品类名id

//添加备注属性remarkString
@property (nonatomic, copy  ) NSString   *remarkString;
//goodsNum：购买的商品数量(1.套餐的购买个数，2普通商品的购买个数)
@property (nonatomic, assign) CGFloat    goodsNum;
@property (nonatomic,retain ) NSString   *commodityOnlyFlag;//商品唯一标志符

//套餐新加属性😄
@property (nonatomic, strong) NSArray        *demands;//单品的要求(后台返回的数据源)
@property (nonatomic, strong) NSArray        *comboItem;//套餐中包含的单品（商品库：元素是字典 购物车：元素是商品）
@property (nonatomic, assign) NSInteger      belongCombo;//(套餐中单品)所属的套餐索引
@property (nonatomic, assign) NSInteger      index;//用来记录套餐在已选列表中的唯一序号(只加不减)
@property (nonatomic, strong) NSMutableArray *addedDemands;//客户添加的要求;
@property (nonatomic, strong) NSString       *categoryShowName;//套餐内子商品的分类展示名
@property (nonatomic, strong) NSNumber       *settingMealInventory;//套餐库存量

////规格新增
//@property (nonatomic, assign) kCommodityType             commodityType;//替换原有isCombo标识商品类型（0：普通单规格单商品，1：普通套餐，2：普通多规格商品）
//@property (nonatomic, strong) XShoppingCartSpecCommodity *specs;//购物车中已选商品的规格
//
//- (BOOL)compare:(XCommodity *)commodity;
//
//- (instancetype)initWithLibraryCommodity:(XLibraryCommodity *)commodity;

- (instancetype)initWithDictionary:(NSDictionary *)dic;

/*!
 *  @author yaomingzhen, 16-02-23 10:02:55
 *
 *  @brief  通过商品库商品创建购物车商品
 *
 *  @param specsCommodity 点单所选的具体规格
 *
 *  @return 返回购物车商品
 */
//- (instancetype)copyToShoppingCartCommodityByCommoditySepcs:(XSpecsCommodity *)specsCommodity saleNumber:(NSInteger)saleNumber;
/*!
 *  @author yaomingzhen, 16-02-25 10:02:56
 *
 *  @brief  获得该商品下所有可选规格商品
 *
 *  @return 该商品下所有可选规格商品 元素为 XSpecsCommodity实例
 */
- (NSArray *)getSpecCommoditys;

/*!
 *  @author yaomingzhen, 16-02-25 12:02:52
 *
 *  @brief   获得该商品下所有规格大类和可选规格
 *
 *  @return 该商品下所有规格大类和可选规格
 */
- (NSArray *)getSpecSummary;

/*!
 *  @author yaomingzhen, 16-02-25 13:02:45
 *
 *  @brief  商品库存改变更新到数据库 （只能用商品库商品调用此方法）
 */
+ (void)updateCommodityInventoryWithAddCount:(CGFloat)count commodityId:(NSString *)commodityId comboQuantity:(CGFloat)quantity isSubCommodity:(BOOL)isSubCommodity;
/*!
 *  @author yaomingzhen, 16-03-01 18:03:41
 *
 *  @brief 更改数据库库存 和内存库存
 *
 *  @param commoditys     当前类的商品数组
 *  @param count          商品数量（可能是子商品的quantity）
 *  @param commodityId    商品id
 *  @param quantity       商品数量（可能是套餐的数量）
 *  @param isSubCommodity 是不是子商品
 */
+ (void)updateCommodityInventoryWithCommoditys:(NSArray *)commoditys AddCount:(CGFloat)count commodityId:(NSString *)commodityId comboQuantity:(CGFloat)quantity isSubCommodity:(BOOL)isSubCommodity;
@end
