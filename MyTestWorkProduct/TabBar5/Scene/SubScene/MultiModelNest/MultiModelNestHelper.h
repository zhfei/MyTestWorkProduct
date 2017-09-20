//
//  MultiModelNestHelper.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/9/13.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MultiModelNestProtocol.h"

@interface MultiModelNestHelper : NSObject
/*!
 *  @author zhoufei
 *
 *  @brief 嵌套对象数组转换为嵌套字典数组
 *  @param nestModelArray 嵌套对象数组
 *  @return 嵌套字典数组
 */
+ (NSArray<NSDictionary *> *)nestDictArrayWithNestModelArray:(NSArray<id<MultiModelNestProtocol> > *)nestModelArray;
/*!
 *  @author zhoufei
 *
 *  @brief 嵌套对象数组转换为嵌套字典数组
 *  @param nestDictArray 嵌套字典数组
 *  @return 嵌套对象数组
 */
+ (NSArray<id<MultiModelNestProtocol> > *)nestModelArrayWithClassName:(Class)cClass
                                                        nestDictArray:(NSArray<NSDictionary *> *)nestDictArray;

@end
