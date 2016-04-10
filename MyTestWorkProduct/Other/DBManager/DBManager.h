//
//  DBManager.h
//  FMDBDemo
//
//  Created by Leo on 15/10/21.
//  Copyright © 2015年 Leo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FMDatabase, ProvinceModel;

typedef void(^DBResultBlock)(BOOL success);
typedef void(^DBQueryResultBlock)(BOOL success, NSArray *resultArray);
typedef void(^DBAllResultBlock)(FMDatabase *db, BOOL success, NSArray *resultArray);

@interface DBManager : NSObject

/**
 *  获取管理类单例
 *
 *  @return 该单例
 */
+ (instancetype)sharedManager;

/**
 *  首次写入数据
 *  C & U
 */
- (void)initDB:(DBResultBlock)resultBlock;



#pragma mark - Main Methods

/**
 *  读取所有 Province
 *
 *  @param resultBlock 结果
 */
- (void)readAllProvinces:(DBAllResultBlock)resultBlock;

/**
 *  根据 ProvinceModel 获取所有的 Region
 *
 *  @param db          数据库
 *  @param province    省份
 *  @param resultBlock 结果
 */
- (void)readRegionsWithDB:(FMDatabase *)db province:(ProvinceModel *)province result:(DBQueryResultBlock)resultBlock;

/**
 *  根据 ProvinceModel 获取所有的 Region
 *
 *  @param province    省份
 *  @param resultBlock 结果
 */
- (void)readRegionsWithProvince:(ProvinceModel *)province result:(DBQueryResultBlock)resultBlock;

@end
