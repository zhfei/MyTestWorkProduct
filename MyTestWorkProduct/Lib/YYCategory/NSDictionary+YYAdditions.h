//
//  NSDictionary+YYAdditions.h
//  YY
//
//  Created by liguowei on 14-10-14.
//  Copyright (c) 2014年 itbox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (YYAdditions)

// 返回字符串，如果没有，默认空字符串
-(NSString *)stringForKey:(id)key;
// 返回数组，如果没有，默认空数组
-(NSArray *)arrayForKey:(id)key;

// 对数组中的对象进行排序，keyString为nil时，表示array是字符串数组
+(NSDictionary *) pinyinDictionaryWithArray:(NSArray *) array keyString:(NSString *) keyString;

// 对字典的某一个key对应的值进行对比
- (BOOL)isEqualToCompareDictionary:(NSDictionary *)compareDictionary withKeyString:(NSString *) keyString;

@end
