//
//  TabBar4ListViewModel.m
//  MyTestWorkProduct
//
//  Created by 周飞 on 2018/9/20.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

#import "TabBar4ListViewModel.h"

@interface TabBar4ListViewModel ()
@property (strong, nonatomic) NSArray<NSString *> *tabBar4ListDataes;
@end

@implementation TabBar4ListViewModel
+ (instancetype)viewModel {
    TabBar4ListViewModel *obj = [self new];
    obj.tabBar4ListDataes = @[@{@"HigherOrderFuncVC":@"高价函数"}];
    return obj;
}
- (NSArray<NSString *> *)dataSouce {
    return _tabBar4ListDataes;
}



@end
