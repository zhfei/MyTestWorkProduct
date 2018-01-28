//
//  NSObject+CallStack.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/6/21.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "NSObject+CallStack.h"

@implementation NSObject (CallStack)


/*!
 *  @author zhoufei
 *
 *  @brief 从调用栈中查询，是否是className类的，methodNames方法中的一个方法调用的
 *
 *  @param className   调用的类名
 *  @param methodNames 方法数组中的某一个方法调用
 *
 *  @return 调用的方法
 */
+(NSString *)methodNameOfCallerWithClassName:(NSString*)className methodNames:(NSArray*)methodNames
{
    
    for (NSString *sourceString in [NSThread callStackSymbols]) {
        
        NSRange start=[sourceString rangeOfString:@"["];
        NSRange end=[sourceString rangeOfString:@"]"];
        
        if (start.location==NSNotFound||end.location==NSNotFound) {
            break;
        }
        
        NSString *string =[sourceString substringWithRange:NSMakeRange(start.location+1, end.location-start.location-1)];
        
        NSMutableArray *array = [NSMutableArray arrayWithArray:[string  componentsSeparatedByString:@" "]];
        
        NSString *classN=[array firstObject];
        if (classN.length==className.length&&[classN isEqualToString:className]) {
            NSString *methodName=[array lastObject];
            
            for (NSString *methodN in methodNames) {
                if (methodName.length==methodN.length&&[methodName isEqualToString:methodN]) {
                    return methodN;
                }
            }
            
        }
    }
    
    return nil;
}



@end
