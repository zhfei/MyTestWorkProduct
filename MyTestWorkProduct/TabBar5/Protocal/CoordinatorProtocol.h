//
//  CoordinatorProtocol.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 2018/10/19.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CoordinatorProtocol <NSObject>
@property (nonatomic, strong) UIViewController *targetVC;
- (void)showUsingPush;
@end
