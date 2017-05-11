//
//  Service.h
//  MyTestWorkProduct
//
//  Created by xuyefeng on 17/5/11.
//  Copyright © 2017年 zhoufei. All rights reserved.
//
//  售后服务部

#import <Foundation/Foundation.h>

@interface Service : NSObject
    // 洗车服务
- (void)carWash;
    
    // 上牌服务
- (void)applyPlate;
    
    // 贴膜服务
- (void)filming;
    
    // 安装行车记录仪
- (void)installTachograph;

@end
