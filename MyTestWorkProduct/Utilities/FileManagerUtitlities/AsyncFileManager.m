//
//  AsyncFileManager.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/2/13.
//  Copyright © 2017年 zhoufei. All rights reserved.
//



#import "AsyncFileManager.h"


//线程队列名称
static char *queueName = "fileManagerQueue";

@interface AsyncFileManager ()
{
    //读写队列
    dispatch_queue_t _fileManagerQueue;
}
@end

@implementation AsyncFileManager
+ (instancetype)sharedFileManager{

    static dispatch_once_t onceToken;
    static AsyncFileManager *asyncFileManager;
    dispatch_once(&onceToken, ^{
        asyncFileManager=[[self alloc] init];
    });
    
    return asyncFileManager;
}

- (instancetype)init
{
    if(self = [super init]) {
        _fileManagerQueue = dispatch_queue_create(queueName, DISPATCH_QUEUE_CONCURRENT);
    }
    return self;
}


- (NSData *)readFile:(NSString *)path
{
    __block NSData *data;
    dispatch_sync(_fileManagerQueue, ^{
        if([[NSFileManager defaultManager] fileExistsAtPath:path]){
            data = [[NSFileManager defaultManager] contentsAtPath:path];
        }
    });
    return data;
}

- (void)readFileAsync:(NSString *)path complete:(void (^)(NSData *data))complete
{
    dispatch_async(_fileManagerQueue, ^{
        NSData *data = nil;
        
        if([[NSFileManager defaultManager] fileExistsAtPath:path]){
            data = [[NSFileManager defaultManager] contentsAtPath:path];
        }
        
        if (complete) {
            complete(data);
        }
    });
}

- (BOOL)writeFile:(NSString *)path data:(NSData *)data
{
    __block BOOL result = NO;
    dispatch_barrier_sync(_fileManagerQueue, ^{
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if([fileManager fileExistsAtPath:path]){
            [fileManager removeItemAtPath:path error:nil];
        }
        
        result = [[NSFileManager defaultManager] createFileAtPath:path contents:data attributes:nil];
        
        
        NSLog(@"写文件：");
    });
    return result;
}

- (void)writeFileAsync:(NSString *)path data:(NSData *)data complete:(void (^)(BOOL result))complete
{
    __block BOOL result = NO;
    dispatch_barrier_async(_fileManagerQueue, ^{
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if([fileManager fileExistsAtPath:path]){
            [fileManager removeItemAtPath:path error:nil];
        }
        
        result = [[NSFileManager defaultManager] createFileAtPath:path contents:data attributes:nil];
        
        if (complete) {
            complete(result);
        }
    });
    
}


@end
