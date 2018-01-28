//
//  Finance.h
//  MyTestWorkProduct
//
//  Created by xuyefeng on 17/5/11.
//  Copyright © 2017年 zhoufei. All rights reserved.
//
//  财务部

#import <Foundation/Foundation.h>

@interface Finance : NSObject

    // 现金支付
- (void)cashPayment;
    
    // 申请贷款
- (BOOL)applyLoan;
    
    // 审核贷款
- (BOOL)auditLoan;
    
    // 放款
- (BOOL)getLoad;

    
@end
