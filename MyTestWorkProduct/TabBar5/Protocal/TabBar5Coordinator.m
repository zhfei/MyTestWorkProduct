//
//  TabBar5Coordinator.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2018/10/19.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

#import "TabBar5Coordinator.h"
#import "Utilities.h"
@implementation TabBar5Coordinator
@synthesize targetVC;
+ (instancetype)coordinatorWithTargetVC:(UIViewController *)targetVC {
    TabBar5Coordinator *coor = [TabBar5Coordinator new];
    coor.targetVC = targetVC;
    return coor;
}

- (void)showUsingPush {
    [[Utilities currentNavigationCtl] pushViewController:self.targetVC animated:YES];
}
@end
