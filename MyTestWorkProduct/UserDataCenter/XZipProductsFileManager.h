//
//  XZipFileManager.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/3/2.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XZipProductsFileManager : NSObject
+(instancetype)sharedInstance;
- (void)handleZipFileToOppositeTablesWithZipFilePath:(NSString *)zipFilePath;
@end
