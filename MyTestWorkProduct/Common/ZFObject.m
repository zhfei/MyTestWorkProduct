//
//  ZFObject.m
//  MyTestWorkProduct
//
//  Created by xuyefeng on 17/3/21.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "ZFObject.h"
#import <objc/runtime.h>

@implementation ZFObject
+ (instancetype)zfObjectWith:(NSDictionary *)dict {
    
    ZFObject *obj = [ZFObject new];
    obj.name = @"huahua";
    obj.address = @"beijing";
    obj.sex = @"男";
    obj.collegeName = @"北京大学";
    obj.age = @(22);
    
    return obj;
}

- (NSMutableDictionary *)changePropertiesDict {

    if (!_changePropertiesDict) {
        _changePropertiesDict = @{}.mutableCopy;
    }
    return _changePropertiesDict;
}

/*!**根据changePropertiesDict修改对象的属性***/
- (void)updateObjectUsingChangePropertiesDict {
   
    NSArray *changePropertyKeyArray = [self.changePropertiesDict allKeys];
    NSInteger count = changePropertyKeyArray.count;
    
    dispatch_apply(count, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(size_t index) {
        NSString * keyString =changePropertyKeyArray[index];
        id       value  = _changePropertiesDict[keyString];
        NSString *methodString = [NSString stringWithFormat:@"set%@:",[keyString capitalizedString]];
        SEL      method = NSSelectorFromString(methodString);
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored   "-Warc-performSelector-leaks"
//        //内存泄漏警告
//        [self performSelector:method withObject:value];
//#pragma clang diagnostic pop
//        
        
//        ignoreLeakWarning([self performSelector:method withObject:value];)
        
        
//        SEL selector = NSSelectorFromString(methodString);
//        IMP imp = [self methodForSelector:selector];
//        void (*func)(id, SEL,id) = (void *)imp;
//        func(self, selector,value);
        
        SEL selector = NSSelectorFromString(methodString);
        ((void (*)(id, SEL,id))[self methodForSelector:selector])(self, selector,value);

        
    });

}

#pragma mark - NSCoding

//将对象编码(即:序列化)
- (void) encodeWithCoder:(NSCoder *)aCoder
{
    unsigned int ivarCount = 0;
    Ivar *ivarArray = class_copyIvarList([self class], &ivarCount);
    for (int i = 0; i<ivarCount; i++) {
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivarArray[i])];
        
        id value = [self valueForKey:key];
//        if ([value isKindOfClass:[XKSVipApiManager class]]) {
//            continue;
//        }
        //归档
        [aCoder encodeObject:value forKey:key];
    }
    free(ivarArray);
}

//将对象解码(反序列化)
-(id) initWithCoder:(NSCoder *)aDecoder
{
    if (self=[super init])
    {
        //RunTime获取类所有实例变量
        unsigned int ivarCount = 0;
        //返回类的属性变量（包括.h文件）
//        objc_property_t *properties = class_copyPropertyList([self class], &propertyCount);
        //返回类的实例变量（包括.h和.m文件）
        Ivar *ivarArray = class_copyIvarList([self class],&ivarCount);//这里的self指的是子类
        for (int i = 0; i<ivarCount; i++) {
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivarArray[i])];
            if([key isEqualToString:@"_apiManager"]) {
                continue;
            }
            //decoder根据实例变量名进行反归档
            id value = [aDecoder decodeObjectForKey:key];
            
            //KVC赋值
            [self setValue:value forKey:key];
        }
        free(ivarArray);//释放内存
    }
    return (self);
    
}





@end
