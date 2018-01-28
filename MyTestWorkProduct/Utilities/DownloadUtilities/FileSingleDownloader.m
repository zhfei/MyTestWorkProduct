//
//  FileSingleDownloader.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/2/20.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "FileSingleDownloader.h"

@interface FileSingleDownloader()<NSURLConnectionDataDelegate,NSURLSessionDelegate,NSURLSessionDownloadDelegate>
/**
* 连接对象
*/
@property (nonatomic, strong) NSURLConnection *conn;


/**
*  写数据的文件句柄
*/
@property (nonatomic, strong) NSFileHandle *writeHandle;
/**
*  当前已下载数据的长度
*/
@property (nonatomic, assign) long long currentLength;
@end

@implementation FileSingleDownloader

 - (NSFileHandle *)writeHandle
 {
     if (!_writeHandle) {
         _writeHandle = [NSFileHandle fileHandleForWritingAtPath:self.destPath];
     }
     return _writeHandle;
 }

 /**
  * 开始(恢复)下载
  */
 - (void)start
 {
     NSURL *url = [NSURL URLWithString:self.url];
     // 默认就是GET请求
     NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
     // 设置请求头信息
     NSString *value = [NSString stringWithFormat:@"bytes=%lld-%lld", self.begin + self.currentLength, self.end];
     [request setValue:value forHTTPHeaderField:@"Range"];
     self.conn = [NSURLConnection connectionWithRequest:request delegate:self];

     self.downloading = YES;
 }

 /**
  * 暂停下载
  */
 - (void)pause
 {
     [self.conn cancel];
     self.conn = nil;

     self.downloading = NO;
 }


 #pragma mark - NSURLConnectionDataDelegate 代理方法
 /**
  *  1. 当接受到服务器的响应(连通了服务器)就会调用
  */
 - (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
 {

 }

 /**
  *  2. 当接受到服务器的数据就会调用(可能会被调用多次, 每次调用只会传递部分数据)
  */
 - (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
 {
     // 移动到文件的尾部
     [self.writeHandle seekToFileOffset:self.begin + self.currentLength];
     // 从当前移动的位置(文件尾部)开始写入数据
     [self.writeHandle writeData:data];

     // 累加长度
     self.currentLength += data.length;

     // 打印下载进度
     double progress = (double)self.currentLength / (self.end - self.begin);
     if (self.progressHandler) {
         self.progressHandler(progress);
     }
 }

 /**
  *  3. 当服务器的数据接受完毕后就会调用
  */
 - (void)connectionDidFinishLoading:(NSURLConnection *)connection
 {
     // 清空属性值
     self.currentLength = 0;

     // 关闭连接(不再输入数据到文件中)
     [self.writeHandle closeFile];
     self.writeHandle = nil;
 }

 /**
  *  请求错误(失败)的时候调用(请求超时\断网\没有网, 一般指客户端错误)
  */
 - (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
 {
     
 }

@end
