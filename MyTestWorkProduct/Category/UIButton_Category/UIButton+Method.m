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
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL sel = @selector(setImage:forState:);
        SEL zfSel = @selector(zf_setImage:forState:);
        Method zfMethod= class_getInstanceMethod([self class], @selector(zf_setImage:forState:));
        Method method= class_getInstanceMethod([self class], @selector(setImage:forState:));
        //将methodB的实现添加到系统方法中也就是说将methodA方法指针添加成方法methodB的返回值表示是否添加成功
        BOOL isAdd =class_addMethod(self, sel,method_getImplementation(zfMethod),method_getTypeEncoding(zfMethod));
        //添加成功了说明本类中不存在methodB所以此时必须将方法b的实现指针换成方法A的，否则b方法将没有实现。
        if(isAdd) {
            class_replaceMethod(self, zfSel,method_getImplementation(method),method_getTypeEncoding(method));
        }else{
            //添加失败了说明本类中有methodB的实现，此时只需要将methodA和methodB的IMP互换一下即可。
            method_exchangeImplementations(zfMethod, method);
        }
    });
}
#pragma mark - hook
//动态转换方法
- (void)zf_setImage:(UIImage *)image forState:(UIControlState)state
{
    NSLog(@"image不能为空—— %s",__func__);
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

#pragma mark - 动态添加方法
+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    if (sel==@selector(eat:)) {
        
        class_addMethod([self class], sel, (IMP)eat, "v@:@");
        
        return YES;
    }
    
    return  [super resolveInstanceMethod:sel];
}
//动态添加方法
void eat(id self, SEL _cmd,id param1)
{
    NSLog(@"eat被调用了：%@---param1:%@", NSStringFromSelector(_cmd),param1
          );
}



@end
