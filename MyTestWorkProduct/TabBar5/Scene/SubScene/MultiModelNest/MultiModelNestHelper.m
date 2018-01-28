//
//  MultiModelNestHelper.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/9/13.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "MultiModelNestHelper.h"

@implementation MultiModelNestHelper


+ (NSArray<NSDictionary *> *)nestDictArrayWithNestModelArray:(NSArray<id<MultiModelNestProtocol> > *)nestModelArray {

    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:nestModelArray.count];
    for (id<MultiModelNestProtocol> nestModel in nestModelArray) {
        NSDictionary *dict = [nestModel produceNestDictionary];
        [arrayM addObject:dict];
    }
    
    return arrayM;
}

+ (NSArray<id<MultiModelNestProtocol> > *)nestModelArrayWithClassName:(Class)cClass
                                                        nestDictArray:(NSArray<NSDictionary *> *)nestDictArray{

    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:nestDictArray.count];
    for (NSDictionary *dict in nestDictArray) {
        id<MultiModelNestProtocol> obj = [[cClass alloc] initWithNestDictionary:dict];
        [arrayM addObject:obj];
    }
    return arrayM;
}

@end
