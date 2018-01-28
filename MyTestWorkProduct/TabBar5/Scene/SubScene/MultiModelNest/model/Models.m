//
//  Models.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/9/12.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "Models.h"
#import "MultiModelNestHelper.h"

@implementation ModelA : NSObject


- (NSDictionary *)produceNestDictionary {
    
    NSDictionary *dict = @{@"username":self.username,
                           @"password":self.password};

    return dict;
}

- (id)initWithNestDictionary:(NSDictionary *)dict {
    
    if (self == [super init]) {
        self.username = [dict objectForKey:@"username"];
        self.password = [dict objectForKey:@"password"];
    }
    return self;
}
@end



@implementation ModelB : NSObject


- (NSDictionary *)produceNestDictionary {
    
    NSDictionary *dict = @{@"modelA":[self.modelA produceNestDictionary],
                           @"age":@(self.age)};
    
    return dict;
}

- (id)initWithNestDictionary:(NSDictionary *)dict {
    
    if (self == [super init]) {
        
        self.modelA = [[ModelA alloc] initWithNestDictionary:[dict objectForKey:@"modelA"]];
        self.age = [[dict objectForKey:@"age"] integerValue];
    }
    return self;
}
@end

@implementation ModelC : NSObject


- (NSDictionary *)produceNestDictionary {
    
    NSArray<NSDictionary *> *arrayM = [MultiModelNestHelper nestDictArrayWithNestModelArray:self.modelBArray];

    NSDictionary *dict = @{@"modelBArray":arrayM,
                           @"man":@(self.man)};
    
    return dict;
}

- (id)initWithNestDictionary:(NSDictionary *)dict {
    
    if (self == [super init]) {
        
        NSArray<id<MultiModelNestProtocol>> *arrayM = [MultiModelNestHelper nestModelArrayWithClassName:[ModelB class] nestDictArray:[dict objectForKey:@"modelBArray"]];
        self.modelBArray = arrayM;
        self.man = [[dict objectForKey:@"man"] boolValue];
    }
    return self;
}
@end

