//
//  ZFObject.h
//  MyTestWorkProduct
//
//  Created by xuyefeng on 17/3/21.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZFObject : NSObject
+ (instancetype)zfObjectWith:(NSDictionary *)dict;
/*!**修改的属性与属性值***/
@property (strong,nonatomic)NSMutableDictionary *changePropertiesDict;
/*!**根据changePropertiesDict修改对象的属性***/
- (void)updateObjectUsingChangePropertiesDict;


@property (strong,nonatomic)NSString*name;
@property (strong,nonatomic)NSString*address;

@property (strong,nonatomic)NSString*sex;
@property (strong,nonatomic)NSString*collegeName;
@property (strong,nonatomic)NSNumber *age;



@end
