//
//  NSDictionary+YYAdditions.m
//  YY
//
//  Created by liguowei on 14-10-14.
//  Copyright (c) 2014年 itbox. All rights reserved.
//

#import "NSDictionary+YYAdditions.h"

@implementation NSDictionary (YYAdditions)


+(NSDictionary *) pinyinDictionaryWithArray:(NSArray *) array {
    NSUInteger count = [array count];
    NSMutableDictionary *reDict = nil;
    // 对数组进行字母分组
    for (int i=0; i<count; i++) {
        id obji = [array objectAtIndex:i];
        NSString *value = nil;
        if ([obji isKindOfClass:[NSString class]]) {
            value = obji;
        }
        if (!value || [value length]==0) {
            continue;
        }
        char c = pinyinFirstLetter([value characterAtIndex:0]);
        value = [[NSString stringWithFormat:@"%c",c] uppercaseString];
        
        if (!reDict) {
            reDict = [NSMutableDictionary dictionary];
        }
        NSMutableArray *dictArray = [reDict objectForKey:value];
        if (!dictArray) {
            dictArray = [NSMutableArray array];
            [reDict setObject:dictArray forKey:value];
        }
        [dictArray addObject:obji];
    }
    // 每个字母对应的数组进行排序
    NSArray *allKeys = [reDict allKeys];
    count = [allKeys count];
    for (int i=0; i<count; i++) {
        NSString *key = [allKeys objectAtIndex:i];
        NSArray *array = [reDict objectForKey:key];
        NSArray *sortedArray = [array sortedArrayUsingSelector:@selector(compare:)];
        [reDict setObject:sortedArray forKey:key];
    }

    return reDict;
}


@end
