//
//  TabBar5Coordinator.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 2018/10/19.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoordinatorProtocol.h"

@interface TabBar5Coordinator : NSObject <CoordinatorProtocol>
+ (instancetype)coordinatorWithTargetVC:(UIViewController *)targetVC;
@end
