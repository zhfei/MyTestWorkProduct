//
//  MultiModelNestProtocol.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/9/12.
//  Copyright © 2017年 zhoufei. All rights reserved.
//
//  多模型嵌套协议

#import <Foundation/Foundation.h>

@protocol MultiModelNestProtocol <NSObject>

@required
/*!
 *  @author zhoufei
 *
 *  @brief  生产嵌套字典
 *  @return 字典
 */
- (NSDictionary *)produceNestDictionary;

/*!
 *  @author zhoufei
 *
 *  @brief 由嵌套字典生成模型
 *  @param dict 字典
 *  @return 模型
 */
- (instancetype)initWithNestDictionary:(NSDictionary *)nestDict;

    
@end
