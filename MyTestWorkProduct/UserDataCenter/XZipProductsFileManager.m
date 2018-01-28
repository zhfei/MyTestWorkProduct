//
//  XZipFileManager.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/3/2.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "XZipProductsFileManager.h"
//#import "XCommodity.h"
#import "XSqliteManager.h"

@implementation XZipProductsFileManager
+(instancetype)sharedInstance
{
    static XZipProductsFileManager *__sigleOne__;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sigleOne__=[[[self class]alloc]init];
    });
    
    return __sigleOne__;
}

- (void)handleZipFileToOppositeTablesWithZipFilePath:(NSString *)zipFilePath;
{
    NSString *path= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    path=[path stringByAppendingString:@"/Pruducts.text"];
    
    //解压
    [Main unzipFileAtPath:zipFilePath toDestination:path progressHandler:^(NSString *entry, unz_file_info zipInfo, long entryNumber, long total) {
        
    } completionHandler:^(NSString *path, BOOL succeeded, NSError *error) {
        
        if (succeeded) {
            //解压后，删除压缩文件
            NSError *subError;
            if (![[NSFileManager defaultManager] removeItemAtPath:zipFilePath error:&subError]) {
                NSLog(@"subError:%@",subError.description);
            }
        }
    }];
    
    //创建商品数据库
    NSString *dbPath= [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingString:@"/productDatabase.db"];
    FMDatabase * fmdb =[FMDatabase databaseWithPath:dbPath];
    if ([fmdb open]) {
        //创建商品表
//        [fmdb executeUpdate:kCreateCommodityTable];
    }else{
    
    }
    
    //将数据写到对应的表中
    NSDate *date1 =[NSDate date];
    int count =1;
    NSMutableArray *totalArrayM =[NSMutableArray array];
    NSMutableArray *arrayM =[NSMutableArray array];
    
    while ([[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithFormat:@"%@/item%d",path,count]]) {
        [totalArrayM removeAllObjects];
        [arrayM removeAllObjects];
        
        NSData *data =[[NSData alloc]initWithContentsOfFile:[NSString stringWithFormat:@"%@/item%d",path,count]];
        id obj= [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        
        for (NSDictionary *dict in obj) {
            
//            XCommodity *comm =[XCommodity yy_modelWithDictionary:dict];
//            [arrayM addObject:comm];
            
        }
        
        
//        for (XCommodity *commodity  in arrayM) {
//            NSString *sqlStr = [NSString stringWithFormat:@"INSERT INTO %@( %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@) VALUES( \'%@\', \'%@\', \'%@\', \'%@\', \'%@\', \'%@\', \'%@\', \'%@\', \'%@\', \'%@\', \'%@\', \'%@\', \'%@\', \'%@\', \'%@\', \'%@\')",kCommodityTable,kCommodityTableCategoryId,kCommodityTableCommodityId,kCommodityTableName,kCommodityTableSequence,kCommodityTablePrice,kCommodityTableInventory,kCommodityTableUnit,kCommodityTableUnitType,kCommodityTableCode,kCommodityTableBarCode,kCommodityTableDemand,kCommodityTableCategory,kCommodityTablePrinterId,kCommodityTableGenre,kCommodityTablePinyin,kCommodityTableType,commodity.categoryId,commodity.commodityID,commodity.commodityName,@(commodity.sequence),@(commodity.price),@(commodity.quantity),commodity.unit,commodity.unitType,commodity.commodityNumber,[NSNull null],[NSNull null],@(0),commodity.printID,@(0), commodity.searchPinyin,commodity.type];
//            
//            [totalArrayM addObject:sqlStr];
//        }
        [[XSqliteManager sharedDBManager:dbPath] executeBatchSQL:totalArrayM];
        
        ++count;
    };
    
    NSLog(@"interval:%lf",[date1 timeIntervalSinceDate:[NSDate date]]);
    
}



@end
