//
//  ZFObject.m
//  MyTestWorkProduct
//
//  Created by xuyefeng on 17/3/21.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "ZFObject.h"

#define ignoreLeakWarning(Stuff) \
{ \
    _Pragma("clang diagnostic push") \
    _Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
    Stuff; \
    _Pragma("clang diagnostic pop") \
}

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
        
        
//        ignoreLeakWarning([self performSelector:method withObject:value];)
        
        
        SEL selector = NSSelectorFromString(methodString);
        IMP imp = [self methodForSelector:selector];
        void (*func)(id, SEL,id) = (void *)imp;
        func(self, selector,value);
        
    });
    
    

}



@end
