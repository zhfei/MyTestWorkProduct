//
//  Models.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/9/12.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MultiModelNestProtocol.h"

@interface ModelA : NSObject <MultiModelNestProtocol>

@property (strong, nonatomic)NSString *username;
@property (strong, nonatomic)NSString *password;

@end

@interface ModelB : NSObject <MultiModelNestProtocol>

@property (strong, nonatomic)ModelA *modelA;
@property (assign, nonatomic)NSInteger age;

@end

@interface ModelC: NSObject <MultiModelNestProtocol>

@property (strong, nonatomic)NSArray<ModelB *> *modelBArray;
@property (assign, nonatomic,getter=isMan)BOOL man;

@end

