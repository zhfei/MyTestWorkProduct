//
//  Person.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/1/7.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>

//extern NSString * const nameKey=@"myName";

@interface Person : NSObject

@property (strong,nonatomic)NSString*name;
@property (strong,nonatomic)NSString*adress;
@property (strong,nonatomic)NSNumber*age;

@property (assign,nonatomic)NSInteger ID;

+ (instancetype)personWithDict:(NSDictionary*)dict;

- (void)run:(void(^)(int))block;

- (void(^)(int))eat;

@end
