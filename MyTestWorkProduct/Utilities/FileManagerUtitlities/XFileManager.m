//
//  XFileManager.m
//  XPay
//
//  Created by Honglin Zhang on 15/4/10.
//  Copyright (c) 2015年 jack zhou. All rights reserved.
//

#import "XFileManager.h"
//#import "XAppInforManager.h"

@implementation XFileManager

//返回根目录路径 "document"
+ (NSString *)getDocumentPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}
//返回 "document/dir/" 文件夹路径,没有则创建
+ (NSString *)getDirectoryForDocuments:(NSString*) dir
{
    NSString* dirPath = [[self getDocumentPath] stringByAppendingPathComponent:dir];
    [self createDir:dirPath];
    return dirPath;
}
//返回 "document/filename" 路径
+ (NSString*)getFilePathForDocuments:(NSString*)filename
{
    return [[self getDocumentPath] stringByAppendingPathComponent:filename];
}
//返回 "document/dir/filename" 路径
+ (NSString*)getFilePathForDocuments:(NSString *)filename inDir:(NSString*)dir
{
    return [[self getDirectoryForDocuments:dir] stringByAppendingPathComponent:filename];
}

+ (void)createDirectoryInDocuments:(void(^)(NSString *dirPath, NSError *error)) resultBlock path:(NSString*) path{

    NSString* dirPath = [[self getDocumentPath] stringByAppendingPathComponent:path];

    BOOL isDir = NO;
    BOOL isCreated = [[NSFileManager defaultManager] fileExistsAtPath:dirPath isDirectory:&isDir];
    if ( isCreated == NO || isDir == NO )
    {
        NSError* error = nil;
        BOOL success = [[NSFileManager defaultManager] createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:&error];
        if(success == NO) {
           NSLog(@"create dir error: %@",error.debugDescription);
            if (resultBlock) {
                resultBlock(nil,error);
            }
        } else {
            if (resultBlock) {
                resultBlock(dirPath,nil);
            }
        }
        
    }else{
    
        if (resultBlock) {
            resultBlock(dirPath,nil);
        }
    }
    
}

//返回根目录路径 "Library"
+ (NSString *)getLibraryPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *libraryDirectory = [paths objectAtIndex:0];
    return libraryDirectory;
}
//返回路径 "Library/Cache"
+ (NSString *)getLibraryCachePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachesDirectory = [paths objectAtIndex:0];
    return cachesDirectory;
}
//返回 "Library/dir/"文件夹路径,没有则创建
+ (NSString *)getDirectoryForLibrary:(NSString *)dir
{
    NSString* dirPath = [[self getLibraryPath] stringByAppendingPathComponent:dir];
    [self createDir:dirPath];
    return dirPath;
}
//返回 "Library/fileName"路径
+ (NSString *)getFilePathForLibrary:(NSString *)filename
{
    return [[self getLibraryPath] stringByAppendingPathComponent:filename];
}
//返回 "Library/dir/filename" 路径
+ (NSString *)getFilePathForLibrary:(NSString *)filename inDir:(NSString *)dir
{
    return [[self getDirectoryForLibrary:dir] stringByAppendingPathComponent:filename];
}

//返回 "Library/Cache/dir"路径,没有则创建
+ (NSString *)getDirectoryForLibraryCache:(NSString *)dir
{
    NSString* dirPath = [[self getLibraryCachePath] stringByAppendingPathComponent:dir];
    [self createDir:dirPath];
    return dirPath;
}
//返回 "Library/Cache/filename"路径
+ (NSString *)getFilePathForLibraryCache:(NSString *)filename
{
    return [[self getLibraryCachePath] stringByAppendingPathComponent:filename];
}
//返回 "Library/Cache/dir/filename"
+ (NSString *)getFilePathForLibraryCache:(NSString *)filename inDir:(NSString *)dir
{
    return  [[self getDirectoryForLibraryCache:dir] stringByAppendingPathComponent:filename];
}


//文件是否存在
+ (BOOL)isFileExists:(NSString*)filepath
{
    return [[NSFileManager defaultManager] fileExistsAtPath:filepath];
}
//删除文件
+ (BOOL)deleteWithFilepath:(NSString*)filepath
{
    return [[NSFileManager defaultManager] removeItemAtPath:filepath error:nil];
}
//返回该文件目录下 所有文件名
+ (NSArray*)getFilenamesWithDir:(NSString*)dir
{
    return [[NSFileManager defaultManager] contentsOfDirectoryAtPath:dir error:nil];
}

+(BOOL)checkStringIsEmpty:(NSString *)string
{
    if(string == nil)
    {
        return YES;
    }
    if([string isKindOfClass:[NSString class]] == NO)
    {
        return YES;
    }
    
    return [[self getTrimStringWithString:string] isEqualToString:@""];
}

+ (NSString *)getTrimStringWithString:(NSString *)string

{
    return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

#pragma mark --method
+ (void)createDir:(NSString *)dirPath
{
    BOOL isDir = NO;
    BOOL isCreated = [[NSFileManager defaultManager] fileExistsAtPath:dirPath isDirectory:&isDir];
    if ( isCreated == NO || isDir == NO )
    {
        NSError* error = nil;
        BOOL success = [[NSFileManager defaultManager] createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:&error];
        if(success == NO)
            NSLog(@"create dir error: %@",error.debugDescription);
    }
}

+ (void)asyncBlock:(void(^)(void))block
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),block);
}

+ (float)fileSizeAtPath:(NSString*)filePath
{
    NSFileManager* manager = [NSFileManager defaultManager];
    long long folderSize = 0;
    if ([manager fileExistsAtPath:filePath]){
        folderSize = [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return folderSize/(1024.0*1024.0);
}

+ (float)fileSizeForDir:(NSString*)path
{
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    float size = 0;
    NSArray* array = [fileManager contentsOfDirectoryAtPath:path error:nil];
    for(int i = 0; i<[array count]; i++)
    {
        NSString *fullPath = [path stringByAppendingPathComponent:[array objectAtIndex:i]];
        
        BOOL isDir;
        if (!([fileManager fileExistsAtPath:fullPath isDirectory:&isDir] && isDir) )
        {
            NSDictionary *fileAttributeDic=[fileManager attributesOfItemAtPath:fullPath error:nil];
            size += fileAttributeDic.fileSize/ 1024.0/1024.0;
        }
        else
        {
            size +=  [self fileSizeForDir:fullPath];
        }
    }
    return size;
}

+ (NSString *)pathForLogWithFileName:(NSString *)fileName
{
    NSString *path = [XFileManager getFilePathForDocuments:fileName];
    return path;
}

+ (BOOL)redirectNSlogToDocumentFolder
{
//    if (NeedSaveLogsInFiles && !TARGET_IPHONE_SIMULATOR) {//if is debug and not simulator
//        NSString *appName = [XAppInforManager sharedInstance].appName;
//        NSString *versionNum = [XAppInforManager sharedInstance].appVersion;
//        NSString *buildNum = [XAppInforManager sharedInstance].appBuild;
//        NSString *deviceName = [XAppInforManager sharedInstance].deviceName;
//        
//        NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
//        [formatter setLocale:[NSLocale currentLocale]];
//        [formatter setDateFormat:@"yyyy-MM-dd-HHmmss"];
//        NSString *dateString = [formatter stringFromDate:[NSDate date]];
//        
//        NSString *logFileName = [NSString stringWithFormat:@"%@_%@(%@)_%@_%@.log", appName, versionNum, buildNum, dateString, deviceName];
//        NSString *logFilePath = [XFileManager pathForLogWithFileName:logFileName];
//        
//        XLog_INFO(@"Begin save log in file: %@", logFilePath);
//        
//        //if is release, the directory will be deleted.
//        if (logFilePath.length != 0) {
//            // 先删除已经存在的文件
//            NSFileManager *defaultManager = [NSFileManager defaultManager];
//            
//            [defaultManager removeItemAtPath:logFilePath error:nil];
//            
//            // 将log输入到文件
//            const char *lfPath = [logFilePath UTF8String];
//            if (strlen(lfPath) != 0) {
//                
//                freopen(lfPath, "a+", stdout);
//            /*// stdout带有缓冲区缓存区未满不会刷入到文件需要及时刷入文件就打开注释
//                setvbuf(stdout, NULL, _IONBF, 0); */
//                freopen(lfPath, "a+", stderr);
//                
//                return YES;
//            }else {
//                XLog_ERROR(@"logfilePath is nil. (const char* use UTF8String)");
//            }
//        }
//    }else {
//        XLog_WARNING(@"The log is not saved in file.");
//    }
    return NO;
}

@end
