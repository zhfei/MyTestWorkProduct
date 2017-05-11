//
//  Finance.m
//  MyTestWorkProduct
//
//  Created by xuyefeng on 17/5/11.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "Finance.h"

@implementation Finance

    // 现金支付
- (void)cashPayment {
 
    NSLog(@"现金支付");
}
    
    // 申请贷款
- (BOOL)applyLoan {
     NSLog(@"申请贷款");
    return YES;
}
    
    // 审核贷款
- (BOOL)auditLoan {
     NSLog(@"审核贷款");
    return YES;
}
    
    // 放款
- (BOOL)getLoad {
     NSLog(@"放款");
    return YES;
}

    
@end
