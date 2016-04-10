//
//  UITextField+YYAdditions.h
//  ManageFinances
//
//  Created by liguowei on 15/1/25.
//  Copyright (c) 2015年 9fbank. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (YYAdditions)
- (NSRange) selectedRange;
- (void) setSelectedRange:(NSRange) range;
@end
