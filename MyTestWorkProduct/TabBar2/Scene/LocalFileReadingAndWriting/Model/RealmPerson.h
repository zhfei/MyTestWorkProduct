//
//  RealmPerson.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/2/10.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import <Realm/Realm.h>
#import "Dog.h"

@interface RealmPerson : RLMObject

@property NSString *name;
@property NSString *address;
@property NSInteger age;
@property RLMArray<Dog> *dogs;
@end



