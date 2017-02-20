//
//  SingletonMacro.h
//  MyTestWorkProduct
//
//  Created by xuyefeng on 17/2/20.
//  Copyright © 2017年 zhoufei. All rights reserved.
//
//  单例宏定义

#ifndef SingletonMacro_h
#define SingletonMacro_h

// .h文件
#define SingletonH(name) + (instancetype)shared##name;

// .m文件
#define SingletonM(name) \
static id _instance; \
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
\
+ (instancetype)shared##name \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return _instance; \
}


#endif /* SingletonMacro_h */
