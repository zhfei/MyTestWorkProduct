//
//  CodingSubClass.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/2/27.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "CodingTemplate.h"

@interface CodingSubClass : CodingTemplate
/*! 商品ID*/
@property (nonatomic, copy  ) NSString      *commodityID;
/*! 商品名字*/
@property (nonatomic, copy  ) NSString      *commodityName;
/*! 单位("杯"，"斤")*/
@property (nonatomic, copy  ) NSString      *unit;
/*! 分档口打印机id*/
@property (nonatomic, copy  ) NSString      *printID;
/*! 商品价格*/
@property (nonatomic, assign) CGFloat       price;
/*! 排序编号*/
@property (nonatomic, assign) NSUInteger    sequence;
/*! 商品编号*/
@property (nonatomic, copy  ) NSString      *commodityNumber;
/*! 商品条码*/
@property (nonatomic, copy  ) NSString      *barcode;
/*! 商品单位类别*/
/*! 商品名称转拼音*/
@property (nonatomic, copy  ) NSString      *searchPinyin;
/*! 商品类名id*/
@property (nonatomic, copy  ) NSString      *categoryId;
/*! 商品是否沽清*/
@property (nonatomic, assign) BOOL          isCleaned;
/*! 单品的要求(要求对象)*/
@property (nonatomic, strong) NSArray *demands;
/*! 商品库存*/
@property (nonatomic, assign) CGFloat       inventory;
/*! 会员折扣后价格*/
@property (nonatomic, strong) NSDecimalNumber *memberPrice;
/*! 商品来源 0:门店，1：集团*/
/*! 创建时间戳，(在搜索页面手动赋值，用于排序)*/
@property (nonatomic,assign)  NSInteger  createTime;
/*! 规格编码（用来搜索排序）*/
@property (nonatomic, copy  ) NSString   *commoditySpecNumberS;
/*! 单商品会员折扣*/

@property (nonatomic, strong) NSDate   *updateTime;

+ (CodingSubClass*)codingSubClass;

@end
