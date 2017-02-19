//
//  NSArray+Additions.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/7/19.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Additions)
/*!
 *  @author zhoufei
 *
 *  @brief 将汉字数组进行分组排序，并将分组的数据用字典返回
 *  @param hanZiArray 汉字字符串数组
 *  @return 分组好的字典数据
 */
+(NSDictionary *)pinYinGroupSortWithArray:(NSArray*)hanZiArray;

@end
