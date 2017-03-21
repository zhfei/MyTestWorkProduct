//
//  XObject.h
//  XPay
//
//  Created by jack zhou on 2/02/15.
//  Copyright (c) 2015 jack zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XObject : NSObject <NSCopying, NSCoding>

- (id)initWithDictionary:(NSDictionary *)JSON error:(NSError * __autoreleasing *)error;

// set json key -> property map here
- (NSDictionary *)JSONKeysToPropertyKeys;
@end
