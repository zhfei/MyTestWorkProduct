//
//  NSData+AES.h
//  XPay
//
//  Created by jack zhou on 2/4/15.
//  Copyright (c) 2015 jack zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (AES)
- (NSData *)AES256EncryptWithKey:(NSString *)key;   //加密
- (NSData *)AES256DecryptWithKey:(NSString *)key;   //解密
@end
