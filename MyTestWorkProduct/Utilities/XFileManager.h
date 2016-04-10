//
//  XFileManager.h
//  XPay
//
//  Created by Honglin Zhang on 15/4/10.
//  Copyright (c) 2015年 jack zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XFileManager : NSObject


//返回根目录路径 "document"
+ (NSString *)getDocumentPath;
//返回 "document/dir/" 文件夹路径,没有则创建
+ (NSString*)getDirectoryForDocuments:(NSString*) dir;
//返回 "document/filename" 路径,没有则创建
+ (NSString*)getFilePathForDocuments:(NSString*)filename;
//返回 "document/dir/filename" 路径,没有则创建
+ (NSString*)getFilePathForDocuments:(NSString *)filename inDir:(NSString*)dir;

//返回根目录路径 "Library"
+ (NSString *)getLibraryPath;
//返回路径 "Library/Cache"
+ (NSString *)getLibraryCachePath;
//返回 "Library/dir"文件夹路径,没有则创建
+ (NSString *)getDirectoryForLibrary:(NSString *)dir;
//返回 "Library/fileName"路径,没有则创建
+ (NSString *)getFilePathForLibrary:(NSString *)filename;
//返回 "Library/dir/filename" 路径,没有则创建
+ (NSString *)getFilePathForLibrary:(NSString *)filename inDir:(NSString *)dir;

//返回 "Library/Cache/dir"路径,没有则创建
+ (NSString *)getDirectoryForLibraryCache:(NSString *)dir;
//返回 "Library/Cache/filename"路径,没有则创建
+ (NSString *)getFilePathForLibraryCache:(NSString *)filename;
//返回 "Library/Cache/dir/filename",没有则创建
+ (NSString *)getFilePathForLibraryCache:(NSString *)filename inDir:(NSString *)dir;


//文件是否存在
+ (BOOL)isFileExists:(NSString*)filepath;
//删除文件
+ (BOOL)deleteWithFilepath:(NSString*)filepath;
//返回该文件目录下 所有文件名
+ (NSArray*)getFilenamesWithDir:(NSString*)dir;

+(BOOL)checkStringIsEmpty:(NSString *)string;
//创建目录dirPath
+ (void)createDir:(NSString *)dirPath;

+ (void)asyncBlock:(void(^)(void))block;
//计算单个文件的大小
+ (float)fileSizeAtPath:(NSString*)filePath;
//计算文件夹下文件的总大小
+ (float)fileSizeForDir:(NSString*)path;

//将标准错误和标准输出重定向到文件
+ (BOOL)redirectNSlogToDocumentFolder;

@end
