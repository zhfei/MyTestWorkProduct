//
//  AsyncFileManager.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/2/13.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AsyncFileManager : NSObject

+ (instancetype)sharedFileManager;

#pragma mark --同步任务
/*!
 *  @author zhoufei
 *
 *  @brief 同步读取文件
 *  @param path 文件目录
 *  @return 读取到的数据
 */
- (NSData *)readFile:(NSString *)path;

/*!
 *  @author zhoufei
 *
 *  @brief 同步写入文件
 *  @param path 文件目录
 *  @param data 文件数据
 *  @return 写入是否成功
 */
- (BOOL)writeFile:(NSString *)path data:(NSData *)data;

#pragma mark --异步任务
/*!
 *  @author zhoufei
 *
 *  @brief 异步读取文件
 *  @param path 文件目录
 *  @return 读取回调block
 */
- (void)readFileAsync:(NSString *)path complete:(void (^)(NSData *data))complete;
/*!
 *  @author zhoufei
 *
 *  @brief 异步写入文件
 *  @param path 文件目录
 *  @return 读取完成回调block
 */

/*!
 *  @author zhoufei
 *
 *  @brief 异步写入文件
 *  @param path 文件目录
 *  @param data     写入的数据
 *  @param complete 写入完成回调block
 */
- (void)writeFileAsync:(NSString *)path data:(NSData *)data complete:(void (^)(BOOL result))complete;

@end
