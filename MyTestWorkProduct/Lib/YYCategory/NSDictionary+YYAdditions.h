//
//  NSDictionary+YYAdditions.h
//  YY
//
//  Created by liguowei on 14-10-14.
//  Copyright (c) 2014年 itbox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (YYAdditions)



/*!
 *  @author zhoufei
 *
 *  @brief 对数组中的字母汉字字符串，进行排序
 *  @param array 字符串数组
 *  @return 排序好的字典
 */

+(NSDictionary *) pinyinDictionaryWithArray:(NSArray *) array;



@end
