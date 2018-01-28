//
//  FileDownloader.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/2/20.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileDownloader : NSObject
/**
* 所需要下载文件的远程URL(连接服务器的路径)
*/
@property (nonatomic, copy) NSString *url;
/**
* 文件的存储路径(文件下载到什么地方)
*/
@property (nonatomic, copy) NSString *destPath;

/**
* 是否正在下载(有没有在下载, 只有下载器内部才知道)
*/
@property (nonatomic, assign) BOOL downloading;

/**
* 用来监听下载进度
*/
@property (nonatomic, copy) void (^progressHandler)(double progress);

/**
* 开始(恢复)下载
*/
- (void)start;

/**
* 暂停下载
*/
- (void)pause;
@end
