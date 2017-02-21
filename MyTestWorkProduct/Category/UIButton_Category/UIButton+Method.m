//
//  UIButton+Method.m
//  MyTestWorkProduct
//
//  Created by xuyefeng on 16/7/3.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "UIButton+Method.h"
#import <objc/message.h>


@implementation UIButton (Method)

- (instancetype)initMethod
{
    self = [super init];
    if (self) {
        
        Method zfMethod= class_getInstanceMethod([self class], @selector(zf_setImage:forState:));
        Method method= class_getInstanceMethod([self class], @selector(setImage:forState:));
        method_exchangeImplementations(zfMethod, method);
        
//        Method method= class_getClassMethod([self class], @selector(buttonWithType:))
    }
    return self;
}

//动态转换方法
- (void)zf_setImage:(UIImage *)image forState:(UIControlState)state
{
    NSLog(@"image不能为空—— %s",__func__);
}
//动态添加方法
void eat(id self, SEL _cmd,id param1)
{
    NSLog(@"eat被调用了：%@---param1:%@", NSStringFromSelector(_cmd),param1
          );
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    if (sel==@selector(eat:)) {
        
        class_addMethod([self class], sel, (IMP)eat, "v@:@");
        
        return YES;
    }
    
    return  [super resolveInstanceMethod:sel];
}

//动态添加属性

- (void)setName:(NSString *)name
{
    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)name
{
    return objc_getAssociatedObject(self, @"name");
}

@end
