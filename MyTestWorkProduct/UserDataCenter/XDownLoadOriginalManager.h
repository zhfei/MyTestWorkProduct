//
//  XDownLoadManager2.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/3/1.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^DownLoadSuccessBlock)(void);
typedef void(^DownLoadFailureBlock)(void);

@interface XDownLoadOriginalManager : NSObject
@property (copy,nonatomic)DownLoadSuccessBlock successBlock;
@property (copy,nonatomic)DownLoadFailureBlock failureBlock;
/**
 * 文件的存储路径(文件下载到什么地方)
 */
@property (nonatomic, copy) NSString *destPath;

/**
 * urlString:所需要下载文件的远程URL(连接服务器的路径)
 * destPath:文件的存储路径(文件下载到什么地方)
 */
- (void)configureDownloadWithUrlString:(NSString*)urlString fileDestPath:(NSString*)destPath;

+(instancetype)sharedInstance;
- (void)downLoad;
@end
