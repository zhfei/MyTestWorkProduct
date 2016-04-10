//
//  NSDictionary+YYAdditions.m
//  YY
//
//  Created by liguowei on 14-10-14.
//  Copyright (c) 2014年 itbox. All rights reserved.
//

#import "NSDictionary+YYAdditions.h"

@implementation NSDictionary (YYAdditions)
-(NSString *)stringForKey:(id)key {
    NSString *result = [self objectForKey:key];
    if([result isKindOfClass:[NSString class]])
    {
        return result;
    }else if([result isKindOfClass:[NSNumber class]]){
        return [(NSNumber *)result stringValue];
    }
    else {
        return @"";
    }
}

-(NSArray *)arrayForKey:(id)key{
    NSArray *result = [self objectForKey:key];
    if ([result isKindOfClass:[NSArray class]]) {
        return result;
    }else if( [result isKindOfClass:[NSString class]]  || [result isKindOfClass:[NSDictionary class]] ){
        return @[result];
    }
    return @[];
}

+(NSDictionary *) pinyinDictionaryWithArray:(NSArray *) array keyString:(NSString *) keyString{
    NSUInteger count = [array count];
    NSMutableDictionary *reDict = nil;
    // 对数组进行字母分组
    for (int i=0; i<count; i++) {
        id obji = [array objectAtIndex:i];
        NSString *value = nil;
        if ([obji isKindOfClass:[NSString class]]) {
            value = obji;
        }else{
            if (keyString) {
                value = [obji objectForKey:keyString];
            }
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
    if (keyString) {
        NSSortDescriptor *sortByName = [NSSortDescriptor sortDescriptorWithKey:keyString
                                                                     ascending:YES];
        NSArray *sortDescriptors = [NSArray arrayWithObject:sortByName];
        for (int i=0; i<count; i++) {
            NSString *key = [allKeys objectAtIndex:i];
            NSArray *array = [reDict objectForKey:key];
            NSArray *sortedArray = [array sortedArrayUsingDescriptors:sortDescriptors];
            [reDict setObject:sortedArray forKey:key];
        }
    }else{
        for (int i=0; i<count; i++) {
            NSString *key = [allKeys objectAtIndex:i];
            NSArray *array = [reDict objectForKey:key];
            NSArray *sortedArray = [array sortedArrayUsingSelector:@selector(compare:)];
            [reDict setObject:sortedArray forKey:key];
        }
    }
    return reDict;
}

- (BOOL)isEqualToCompareDictionary:(NSDictionary *)compareDictionary withKeyString:(NSString *)keyString{
    if ([[self stringForKey:keyString] isEqualToString:[compareDictionary stringForKey:keyString]]) {
        return YES;
    }
    return NO;
}
@end
