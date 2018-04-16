//
//  Dog.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/11/2.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import <Realm/Realm.h>

@interface Dog : RLMObject
@property NSString * name;
@property NSInteger  age;
@end

RLM_ARRAY_TYPE(Dog)
