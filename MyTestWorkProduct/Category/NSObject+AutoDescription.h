//
//  NSObject+AutoDescription.h
//  XPay
//
//  Created by jack zhou on 1/19/15.
//  Copyright (c) 2014 jack zhou. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface NSObject (AutoDescription)

// Reflects about self.
// Format: [ClassName {prop1 = val1; prop2 = val2; }].,
// SuperClass' properties included (until NSObject).
- (NSString *) autoDescription; // can be in real description or somewhere else

@end
