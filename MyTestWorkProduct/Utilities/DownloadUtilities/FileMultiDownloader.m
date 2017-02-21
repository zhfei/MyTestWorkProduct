//
//  FileMultiDownloader.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/2/21.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "FileMultiDownloader.h"
#import "FileSingleDownloader.h"


#define MaxDownloadCount 4

@interface FileMultiDownloader()
@property (nonatomic, strong) NSMutableArray *singleDownloaders;
@property (nonatomic, assign) long long totalLength;
@end

@implementation FileMultiDownloader

 - (void)getFilesize
 {
     NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.url]];
     request.HTTPMethod = @"HEAD";

     NSURLResponse *response = nil;
     NSURLSessionDataTask *task= [[NSURLSession sharedSession]dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
          self.totalLength = response.expectedContentLength;
     }];
     [task resume];
 }

 - (NSMutableArray *)singleDownloaders
 {
     if (!_singleDownloaders) {
         _singleDownloaders = [NSMutableArray array];
         
         // 获得文件大小
         [self getFilesize];

         // 每条路径的下载量
         long long size = 0;
         if (self.totalLength % MaxDownloadCount == 0) {
             size = self.totalLength / MaxDownloadCount;
         } else {
             size = self.totalLength / MaxDownloadCount + 1;
         }

         // 创建N个下载器
         for (int i = 0; i<MaxDownloadCount; i++) {
             FileSingleDownloader *singleDownloader = [[FileSingleDownloader alloc] init];
             singleDownloader.url = self.url;
             singleDownloader.destPath = self.destPath;
             singleDownloader.begin = i * size;
             singleDownloader.end = singleDownloader.begin + size - 1;
             singleDownloader.progressHandler = ^(double progress){
                 NSLog(@"%d --- %f", i, progress);
             };
             [_singleDownloaders addObject:singleDownloader];
         }

         // 创建一个跟服务器文件等大小的临时文件
         [[NSFileManager defaultManager] createFileAtPath:self.destPath contents:nil attributes:nil];

         // 让self.destPath文件的长度是self.totalLengt
         NSFileHandle *handle = [NSFileHandle fileHandleForWritingAtPath:self.destPath];
         [handle truncateFileAtOffset:self.totalLength];
     }
     return _singleDownloaders;
 }

 /**
  * 开始(恢复)下载
  */
 - (void)start
 {
     [self.singleDownloaders makeObjectsPerformSelector:@selector(start)];
     
     self.downloading = YES;
 }

 /**
  * 暂停下载
  */
 - (void)pause
 {
     [self.singleDownloaders makeObjectsPerformSelector:@selector(pause)];
     self.downloading = NO;
 }


@end
