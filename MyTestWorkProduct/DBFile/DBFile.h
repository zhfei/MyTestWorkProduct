//
//  DBFile.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/3/2.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#ifndef DBFile_h
#define DBFile_h

#define kCommodityCategoryTable          @"commodityCategoryTable"         // 商品类别表
#define kCommodityTable                  @"commodityTable"                 // 商品表
#define kSpecCommodityTable              @"specCommodityTable"             // 规格商品表
#define kCommodityVipPriceTable          @"commodityVipPriceTable"         // 商品会员价
#define kSpecCommodityConfigurationTable @"specCommodityConfigurationTable"// 规格商品规格配置表

// 商品类别表
#define kCreateCommodityCategoryTable @"CREATE TABLE IF NOT EXISTS commodityCategoryTable (`categoryId` integer default'0',`name` text,`sequence` integer);"
// 商品表
#define kCreateCommodityTable @"CREATE TABLE IF NOT EXISTS commodityTable(`categoryId` integer default '0',`commodityId` integer default '0',`name` text,`sequence` integer default '0',`price` real,`inventory` real default '0',`unit` text,`unitType` integer default '0',`code` text,`barCode` text,`demand` text,`category` integer DEFAULT '0',`printerId` text,`genre` text,`pinyin` text,`type` text,`subCommoditys` text, `specSummary` text);"

#define kAddIndexOnCommodityTable @"CREATE INDEX IF NOT EXISTS CommodityTable_index on commodityTable(commodityId)"

// 规格商品表
#define kCreateSpecCommodityTable @"CREATE TABLE IF NOT EXISTS specCommodityTable(`commodityId` integer default '0',`specId` integer default '0',`price` text,`inventory` real,`code` text,`barCode` text,`specDetail` text,`merchantItemId` text);"
#define kAddIndexOnSpecCommodityTable1 @"CREATE INDEX IF NOT EXISTS SpecCommodityTable_index1 on specCommodityTable(commodityId)"
#define kAddIndexOnSpecCommodityTable2 @"CREATE INDEX IF NOT EXISTS SpecCommodityTable_index2 on specCommodityTable(specId)"

// 商品会员价
#define kCreateCommodityVipPriceTable @"CREATE TABLE IF NOT EXISTS commodityVipPriceTable(`commodityId` integer default '0',`vipTypeId` integer, `discountValue` real, discountPrice text);"
#define kAddIndexOnCommodityVipPriceTable @"CREATE INDEX IF NOT EXISTS CommodityVipPriceTable_index on commodityVipPriceTable(commodityId)"

// 规格商品规格配置表
#define kCreateSpecCommodityConfigurationTable @"CREATE TABLE IF NOT EXISTS specCommodityConfigurationTable(`specId` integer default '0',`categoryName` text,`specItemId` integer default '0',`specItemName` text);"
#define kAddIndexOnSpecCommodityConfigurationTable @"CREATE INDEX IF NOT EXISTS SpecCommodityConfigurationTable_index on specCommodityConfigurationTable(specId)"


#define kCreateContentTable @"CREATE TABLE `tableName1` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE, `name` TEXT, `sex` TEXT DEFAULT 男, `age` TEXT)"



// ************************ commodityTable(商品表) ************************* //
#define kCommodityTableCategoryId         @"categoryId"   // 类别Id
#define kCommodityTableCommodityId        @"commodityId"  // 商品Id
#define kCommodityTableName               @"name"         // 商品名称
#define kCommodityTableSequence           @"sequence"     // 商品顺序号
#define kCommodityTablePrice              @"price"        // 商品单价
#define kCommodityTableInventory          @"inventory"    // 商品库存
#define kCommodityTableUnit               @"unit"         // 单位
#define kCommodityTableUnitType           @"unitType"     // 单位类型（0：计件，1：计重）
#define kCommodityTableCode               @"code"         // 商品编号
#define kCommodityTableBarCode            @"barCode"      // 商品条码
#define kCommodityTableDemand             @"demand"       // 要求
#define kCommodityTableCategory           @"category"// 商品类型（0：普通商品，1：套餐商品，2：规格商品）

#define kCommodityTablePrinterId          @"printerId"    //分档口打印id
#define kCommodityTableGenre              @"genre"
#define kCommodityTablePinyin             @"pinyin"       //拼音
#define kCommodityTableType               @"type"         //计价类型（“PIECE” Or “WEIGH”）
#define kCommodityTableSubCommoditys      @"subCommoditys"//子商品
#define kCommodityTableSpecSummary        @"specSummary"  //规格类别和类别下可选子规格


// ************************ specCommodityTable(规格商品表) ************************* //
#define kSpecCommodityTableCommodityId    @"commodityId"  // 商品Id
#define kSpecCommodityTableSpecId         @"specId"       // 规格Id
#define kSpecCommodityTablePrice          @"price"        // 价格
#define kSpecCommodityTableInventory      @"inventory"    // 库存
#define kSpecCommodityTableCode           @"code"         // 商品编码
#define kSpecCommodityTableBarCode        @"barCode"      // 商品条码
#define kSpecCommodityTableSpecDetail     @"specDetail"   // 商品规格配置
#define kSpecCommodityTableMerchantItemId @"merchantItemId"//商户id

// ************************ commodityVipPriceTable(商品会员价) ************************* //
#define kCreateCommodityVipPriceTableCommodityId     @"commodityId"  // 商品Id
#define kCreateCommodityVipPriceTableVipTypeId       @"vipTypeId"    // 会员类型Id
#define kCreateCommodityVipPriceTableDiscountValue   @"discountValue"// 折扣
#define kCreateCommodityVipPriceTableDiscountPrice   @"discountPrice"// 折扣后价格

// *************** specCommodityConfigurationTable(规格商品规格配置表) ************** //
#define kspecCommodityConfigurationTableSpecId       @"specId"       // 规格Id
#define kspecCommodityConfigurationTableCategoryName @"categoryName" // 规格类别
#define kspecCommodityConfigurationTableSpecItemId   @"specItemId"   // 子规格Id号
#define kspecCommodityConfigurationTableSpecItemName @"specItemName" // 子规格名称


#endif /* DBFile_h */
