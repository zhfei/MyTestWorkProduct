//
//  XDownLoadManager2.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/3/1.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "XDownLoadOriginalManager.h"
#import "AFNetworking.h"
#import "XDownLoadProgressView.h"

@interface XDownLoadOriginalManager()<NSURLConnectionDataDelegate,NSURLSessionDelegate,NSURLSessionDownloadDelegate>
{
    NSURLSessionDownloadTask * _downloadtask;//当前下载任务
    NSData * _resumeData;                  //纪录断点续传时，暂停前的下载数据
    NSURLSession * _session;         //当前会话
    NSMutableURLRequest * _request;         //当前网络请求
}

/**
 * 所需要下载文件的远程URL(连接服务器的路径)
 */
@property (nonatomic, copy) NSString *urlString;


@end

@implementation XDownLoadOriginalManager

+(instancetype)sharedInstance
{
    static XDownLoadOriginalManager *__singleOne__;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __singleOne__=[[[self class]alloc]init];
    });
    
    return __singleOne__;
}

- (instancetype)init
{
    self = [super init];
    if (self) {

    }
    return self;
}


//获取Documents目录
-(NSString *)dirDoc{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}


/**
 * urlString:所需要下载文件的远程URL(连接服务器的路径)
 * destPath:文件的存储路径(文件下载到什么地方)
 */
- (void)configureDownloadWithUrlString:(NSString*)urlString fileDestPath:(NSString*)destPath
{
    self.urlString=urlString;
    self.destPath=destPath;
}

//下载
- (void)downLoad{

    [[UIApplication sharedApplication].keyWindow addSubview:[XDownLoadProgressView sharedInstance]];
    //    //下载进度条
    [[XDownLoadProgressView sharedInstance] setFrame:[UIApplication sharedApplication].keyWindow.frame];
 
   
    
    [XDownLoadProgressView sharedInstance].DownLoadProgressCancleBlock=^{
        [self cancle];
    };
    [XDownLoadProgressView sharedInstance].DownLoadProgressPauseOrRestartBlock=^(BOOL isSelected){
        if (isSelected) {
            [self pause];
        }else{
            [self resume];
        }
    };

   
    NSURLSessionConfiguration * config=[NSURLSessionConfiguration defaultSessionConfiguration];
    _session=[NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:nil];

    //
    NSURL *url=[NSURL URLWithString:self.urlString];
    _request=[NSMutableURLRequest requestWithURL:url];
    _downloadtask= [_session downloadTaskWithRequest:_request];
    
//    [headers setValue:contentType forKey:@"Content-Type"];
//    [headers setValue:@"text/html" forKey:@"Accept"];
//    [headers setValue:@"no-cache" forKey:@"Cache-Control"];
//    [headers setValue:@"no-cache" forKey:@"Pragma"];
//    [headers setValue:@"close" forKey:@"Connection"];
//    NSMutableURLRequest *request = [NSMutableURLRequest
    
    NSLog(@"开始加载");
    _resumeData=nil;

    [_downloadtask resume];
}
//取消
- (void)cancle
{
    [_downloadtask cancel];
    _resumeData=nil;
    _downloadtask=nil;
    _request=nil;
    _session=nil;
    [[XDownLoadProgressView sharedInstance] removeFromSuperview];
}
//暂停
- (void) pause{
    //暂停
    NSLog(@"暂停下载");
    [_downloadtask cancelByProducingResumeData:^(NSData *resumeData) {
        _resumeData=resumeData;
    }];
    [_downloadtask suspend];
}
//恢复
- (void) resume{
    //恢复
    NSLog(@"恢复下载");
    if(!_resumeData){
        NSURL *url=[NSURL URLWithString:self.destPath];
        _request=[NSURLRequest requestWithURL:url];
        _downloadtask=[_session downloadTaskWithRequest:_request];
    }else{
        _downloadtask=[_session downloadTaskWithResumeData:_resumeData];
       
    }
    [_downloadtask resume];
     _resumeData=nil;
}

#pragma mark - delegate
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location{
    NSURL * url=[NSURL fileURLWithPath:self.destPath];
    NSFileManager * manager=[NSFileManager defaultManager];
    BOOL move= [manager moveItemAtURL:location toURL:url error:nil];
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [[XDownLoadProgressView sharedInstance] removeFromSuperview];
        if (self.successBlock) {
            self.successBlock();
        }
    }) ;
}
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
      didWriteData:(int64_t)bytesWritten
 totalBytesWritten:(int64_t)totalBytesWritten
totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{
    CGFloat progress=(totalBytesWritten*1.0)/totalBytesExpectedToWrite;
    dispatch_async(dispatch_get_main_queue(), ^{
        [[XDownLoadProgressView sharedInstance] setProgress:progress];
    }) ;
}


// 3.请求成功或者失败（如果失败，error有值）
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task
didCompleteWithError:(nullable NSError *)error
{

    if (![error.userInfo[@"NSLocalizedDescription"] isEqualToString:@"cancelled"]&&self.failureBlock) {
        dispatch_sync(dispatch_get_main_queue(), ^{
            [[XDownLoadProgressView sharedInstance] removeFromSuperview];
        });
        self.failureBlock();
    }
}

@end
