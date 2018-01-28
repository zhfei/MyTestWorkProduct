//
//  SelectBoxAlertController.h
//  BlueCat
//
//  Created by zhoufei on 16/10/10.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectBoxAlertController : UIAlertController

/*!
 *  @author zhoufei
 *
 *  @brief 带有单选框的AlertController
 *  @param block1  “确定”block
 *  @param block2  “取消”block
 *  @param block13 “单选框勾选状态”block
 *  @return 实例
 */
+ (SelectBoxAlertController*)selectBoxAlertControllerWithMakeSureBlock:(void(^)())block1 cancleBlock:(void(^)())block2 selectBoxBlock:(void(^)(BOOL))block3;

+ (UIAlertController *)alertViewController:(NSString *)title;

@end
