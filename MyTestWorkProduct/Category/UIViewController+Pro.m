//
//  UIViewController+Pro.h
//  MyTestWorkProduct
//
//  Created by 周飞 on 2018/9/20.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

#import "UIViewController+Pro.h"
#import <objc/runtime.h>
#import <objc/message.h>

const char *kAssist = "assist";

@implementation UIViewController (Pro)
- (NSString *)assist {
    return objc_getAssociatedObject(self, kAssist);
}
- (void)setAssist:(NSString *)assist {
    objc_setAssociatedObject(self, kAssist, assist, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
