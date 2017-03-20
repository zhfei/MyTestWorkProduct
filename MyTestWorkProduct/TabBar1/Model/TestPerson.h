//
//  Person.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/4/13.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TestPerson;
@protocol personWorkDelegate <NSObject>

- (void)personWork:(TestPerson*)person;
@end

@interface TestPerson : NSObject
@property (weak,nonatomic)id<personWorkDelegate> delegate;
@property (strong,nonatomic)NSString*name;
@property (strong,nonatomic)NSString*address;

@property (strong,nonatomic)NSString*sex;
@property (strong,nonatomic)NSString*collegeName;
@property (strong,nonatomic)NSNumber *age;

- (void)eat;
- (void)sleep;
- (void)work;

@end
