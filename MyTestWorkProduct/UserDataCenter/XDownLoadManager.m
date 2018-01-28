//
//  XDownLoadManager.m
//  Coffee
//
//  Created by zhoufei on 16/2/19.
//  Copyright © 2016年 XPay. All rights reserved.
//

#import "XDownLoadManager.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"
#import "XDownLoadProgressView.h"

@interface XDownLoadManager()
{
     BOOL _downloading;
    
}
@property (assign,nonatomic) long long totalLength;//下载文件大小
@property (strong,nonatomic)AFHTTPRequestOperation *op;
@end

@implementation XDownLoadManager

+(instancetype)sharedInstance
{
    static XDownLoadManager *__singleOne__;
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
        
        //保存路径
        NSString *rootPath = [self dirDoc];
        self.destPath= [rootPath  stringByAppendingString:@"/Pruducts.zip"];
    }
    return self;
}

//下载文件大小
- (void)getFilesize
{
 NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.urlString]];
 request.HTTPMethod = @"HEAD";
    
    NSURLSession *sesson =[NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask= [sesson dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        self.totalLength = response.expectedContentLength;
        NSLog(@"self.totalLength:%lld",self.totalLength);
    }];
    
    [dataTask resume];
}

- (void)downloadFileWithCurrentView:(UIView*)view {
    
    [[UIApplication sharedApplication].keyWindow addSubview:[XDownLoadProgressView sharedInstance]];
//    //下载进度条
    [[XDownLoadProgressView sharedInstance] setFrame:[UIApplication sharedApplication].keyWindow.frame];
    
    [XDownLoadProgressView sharedInstance].DownLoadProgressCancleBlock=^{
        [self.op cancel];
        if ([self.op isPaused]) {
            [self.op resume];
        }
    };
    [XDownLoadProgressView sharedInstance].DownLoadProgressPauseOrRestartBlock=^(BOOL isSelected){
        if (isSelected) {
            [self.op pause];
            
        }else{
            [self.op resume];
        }
    };
    
    [self getFilesize];
    
    //初始化队列
    NSOperationQueue *queue = [[NSOperationQueue alloc ]init];
    //下载地址
    NSURL *url = [NSURL URLWithString:self.urlString];
    
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc]initWithRequest:[NSURLRequest requestWithURL:url]];
    self.op=op;
    op.outputStream = [NSOutputStream outputStreamToFileAtPath:self.destPath append:NO];
    // 根据下载量设置进度条的百分比
    [op setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
        CGFloat precent = (CGFloat)totalBytesRead / totalBytesExpectedToRead;
        [[XDownLoadProgressView sharedInstance] setProgress:precent];
    }];
    
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"下载成功");
        [[XDownLoadProgressView sharedInstance] removeFromSuperview];

        if (self.successBlock) {
            self.successBlock();
        }
    
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"下载失败");
        [[XDownLoadProgressView sharedInstance] removeFromSuperview];
    }];
    //开始下载
    [queue addOperation:op];
    
}

//获取Documents目录
-(NSString *)dirDoc{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    return documentsDirectory;
}

@end
