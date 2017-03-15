//
//  OptionHeadlineHelper.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/2/22.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "OptionHeadlineHelper.h"

static OptionHeadlineHelper *ohh=nil;

@interface OptionHeadlineHelper()
@property (strong,nonatomic)NSDictionary *dictInfo;
@end


@implementation OptionHeadlineHelper
+ (instancetype)sharedOptionHeadlineHelper {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ohh=[[self alloc] init];
        [ohh setDictionayInfo];
    });
    
    return ohh;
}

//+ (instancetype)allocWithZone:(struct _NSZone *)zone{
//
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        ohh=[[self alloc] init];
//    });
//    
//    return ohh;
//}

- (id)copyWithZone:(struct _NSZone *)zone{
    
    return ohh;
}

- (void)setDictionayInfo {

    NSString *path =[[NSBundle mainBundle] pathForResource:@"OptionHeadline" ofType:@"plist"];
    
    path =[[NSBundle mainBundle] pathForResource:@"TabBar5" ofType:@"plist"];
    
    _dictInfo=[[NSDictionary alloc]initWithContentsOfFile:path];
    
    NSLog(@"%@:----%@",NSStringFromSelector(_cmd),_dictInfo);
}

- (NSDictionary *)dictionayInfo {

    return _dictInfo;
}


@end
