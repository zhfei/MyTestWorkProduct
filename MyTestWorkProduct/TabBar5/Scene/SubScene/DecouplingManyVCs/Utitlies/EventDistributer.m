//
//  EventDistributer.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/24.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "EventDistributer.h"
#import "EventProtocol.h"
#import <objc/runtime.h>

@implementation EventDistributer

+ (void)presentAppStoreByAppId:(NSString*)appId dismissAction:(void(^)(BOOL success, NSString *errorMsg))dismissBlock {

}


/*!
 *  @author zhoufei
 *
 *  @brief 发送一个事件
 *  @param className 事件接收对象，控制器类名
 *  @param parametes 参数
 *  @return 结果
 */
+ (id)sendViewControllerEvent:(NSString *)className parametes:(id)parametes {
    
    Class <EventProtocol> responseClass =  NSClassFromString(className);
    
    if (class_conformsToProtocol(responseClass, @protocol(EventProtocol))) {
        if ([responseClass eventCheckParametesAvaliable:parametes]) {
            id responseItem = [responseClass eventNewObjectWithParametes:parametes];
            if (responseItem && [responseItem isKindOfClass:[UIViewController class]]) {
                return responseItem;
            } else {
                NSLog(@"对象无法实例化");
            }
        } else {
            NSLog(@"参数错误");
        }
    } else {
        NSLog(@"对象未遵守协议");
    }

    return nil;
}


@end
