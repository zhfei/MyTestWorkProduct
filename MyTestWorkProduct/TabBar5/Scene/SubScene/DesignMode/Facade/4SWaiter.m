//
//  4SWaiter.m
//  MyTestWorkProduct
//
//  Created by xuyefeng on 17/5/11.
//  Copyright © 2017年 zhoufei. All rights reserved.
//
//  接待人员

#import "4SWaiter.h"
#import "Finance.h"
#import "Sales.h"
#import "Service.h"

@interface _SWaiter ()
{
    Finance   *finance;// 财务部门
    Sales     *sales;// 销售部门
    Service   *service;// 售后服务部门
}

@end

@implementation _SWaiter
    
- (instancetype)init
{
    self = [super init];
    if (self) {
        finance = [[Finance alloc] init];
        sales = [[Sales alloc] init];
        service = [[Service alloc] init];
    }
    return self;
}
    
    // 现金买车
- (void)buyCarWithCash{
    // 现金支付
    [finance cashPayment];
    
    // 赠送礼品
    [self gift];
    
    // 提供服务
    [self service];
}
    
    // 贷款买车
- (void)buyCarWithLoad{
    
    BOOL _isSuccess = [finance applyLoan];
    
    // 如果贷款审批下来，则提车、送赠品和服务
    if (_isSuccess) {
        [sales provideCar];
        [self gift];
        [self service];
    }else{
        NSLog(@"贷款审批未通过！");
    }
}
    
    // 赠品
- (void)gift{
    NSLog(@"赠品有:");
    [sales carFilm];
    [sales tachograph];
    [sales engineGuard];
    [sales mat];
}
    
    // 服务
- (void)service{
    NSLog(@"售后服务:");
    [service carWash];
    [service applyPlate];
    [service filming];
    [service installTachograph];
}

@end
