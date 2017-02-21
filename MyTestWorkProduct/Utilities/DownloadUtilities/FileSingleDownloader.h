//
//  FileSingleDownloader.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/2/20.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "FileDownloader.h"

@interface FileSingleDownloader : FileDownloader
/**
*  开始的位置
*/
@property (nonatomic, assign) long long begin;
/**
*  结束的位置
*/
@property (nonatomic, assign) long long end;
@end
