//
//  XDownLoadManager.h
//  Coffee
//
//  Created by zhoufei on 16/2/19.
//  Copyright © 2016年 XPay. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^DownLoadSuccessBlock)(void);
typedef void(^DownLoadFailureBlock)(void);

@interface XDownLoadManager : NSObject
@property (copy,nonatomic)DownLoadSuccessBlock successBlock;
@property (copy,nonatomic)DownLoadFailureBlock failureBlock;


/**
* 所需要下载文件的远程URL(连接服务器的路径)
*/
@property (nonatomic, copy) NSString *urlString;
/**
* 文件的存储路径(文件下载到什么地方)
*/
@property (nonatomic, copy) NSString *destPath;

/**
* 是否正在下载(有没有在下载, 只有下载器内部才知道)
*/
@property (nonatomic, readonly) BOOL downloading;

/**
* 用来监听下载进度
*/
@property (nonatomic, copy) void (^progressHandler)(double progress);


+(instancetype)sharedInstance;

//下载文件
- (void)downloadFileWithCurrentView:(UIView*)view ;
//下载文件大小
- (void)getFilesize;

@end
