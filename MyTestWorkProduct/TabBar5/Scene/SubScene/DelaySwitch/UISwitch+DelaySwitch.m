//
//  UISwitch+DelaySwitch.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/12/15.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "UISwitch+DelaySwitch.h"
#import <objc/message.h>

@implementation UISwitch (DelaySwitch)
+ (void)aa {
    
//    Method setOnMethod = class_getClassMethod([self class], @selector(setOn:));
//    Method delay_setOnMethod = class_getClassMethod([self class], @selector(delay_setOn:));
//
//    if (!setOnMethod) {
//        NSLog(@"selector %@ in %@ is not found", NSStringFromSelector(@selector(setOn:)), self);
//        return ;
//    }
//
//    if (setOnMethod) {
//        //比较Selector的TypeEncoding
//        NSString *oriTypeEcodeing = [NSString stringWithCString:method_getTypeEncoding(setOnMethod) encoding:NSUTF8StringEncoding];
//        NSString *swizzedTypeEcodeing = [NSString stringWithCString:method_getTypeEncoding(delay_setOnMethod) encoding:NSUTF8StringEncoding];
//
//        if (![oriTypeEcodeing isEqualToString:swizzedTypeEcodeing]) {
//            NSLog(@"Trying to swizze methods with different typeEncodeing");
//            return;
//        }
//    }
//
//    BOOL didAddMethod =
//    class_addMethod([self class],
//                    @selector(setOn:),
//                    method_getImplementation(delay_setOnMethod),
//                    method_getTypeEncoding(delay_setOnMethod));
//
//    if (didAddMethod) {
//        class_replaceMethod([self class],
//                            @selector(delay_setOn:),
//                            method_getImplementation(setOnMethod),
//                            method_getTypeEncoding(setOnMethod));
//    } else {
//        //为类添加新的实例方法
//        BOOL didAddSwizzedMethod =
//        class_addMethod([self class],
//                        @selector(delay_setOn:),
//                        method_getImplementation(setOnMethod),
//                        method_getTypeEncoding(setOnMethod));
//
//        if (!didAddSwizzedMethod) {
//            NSLog(@"class:%@ already has method:%@", self, NSStringFromSelector(method_getName(delay_setOnMethod)));
//            return;
//        }
    
    Method originalMethodNew = class_getInstanceMethod([self class], @selector(setOn:));
    Method swizzledMethodNew = class_getInstanceMethod([self class], @selector(delay_setOn:));
    
    method_exchangeImplementations(originalMethodNew, swizzledMethodNew);
//    }
}

-(void)switchAction:(id)sender
{
    UISwitch *switchButton = (UISwitch*)sender;
    BOOL isButtonOn = [switchButton isOn];
    NSLog(@"isButtonOn:%d",isButtonOn);
}

- (void)delay_setOn:(BOOL)on {
    [self delay_setOn:on];
    [self autoDelay];
}

- (void)autoDelay {
    
    self.enabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.enabled = YES;
    });
}

- (void)setOn:(BOOL)on {
    
}

@end
