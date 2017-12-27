//
//  AbroadShoppingHomeView.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/12/18.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "AbroadShoppingHomeView.h"
#import "AbroadShoppingHomeHeaderView.h"
#import "AbroadSelectGoodsViewCell.h"

#define kscaleDeviceLength(num) num

@interface AbroadShoppingHomeView ()<UITableViewDataSource, UITableViewDelegate>
{
    id<AbroadShoppingHomeModelInterface> _abroadshoppinghomeViewModel;
}
@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) AbroadShoppingHomeHeaderView * headerView;

@end

@implementation AbroadShoppingHomeView

- (void)dealloc {
    NSLog(@"%@ - execute %s",NSStringFromClass([self class]),__func__);
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder  {
    
    self = [super initWithCoder:coder];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableHeaderView = self.headerView;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (AbroadShoppingHomeHeaderView *)headerView {
    
    if (!_headerView) {
        _headerView = [AbroadShoppingHomeHeaderView new];
        _headerView.hidden = YES;
    }
    return _headerView;
}

- (void)setupSubviews {
    [self addSubview:self.tableView];
}

- (void)setAbroadshoppinghomeViewModel:(id<AbroadShoppingHomeViewModelInterface>)abroadshoppinghomeViewModel {
    _abroadshoppinghomeViewModel = abroadshoppinghomeViewModel;
    if (abroadshoppinghomeViewModel.model.reload) {
        _headerView.hidden = !abroadshoppinghomeViewModel.model.isLoaded;
        _headerView.model = abroadshoppinghomeViewModel.model;
        CGFloat headerViewH = abroadshoppinghomeViewModel.model.remainingTime.length
        ? kscaleDeviceLength(160) + (self.width / 4) * 1.1 + 290
        : kscaleDeviceLength(160) + (self.width / 4) * 1.1 + 50;
        _headerView.frame = CGRectMake(0, 0, 0, headerViewH);
        [_tableView reloadData];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;//_abroadshoppinghomeViewModel.model.selectGoods.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AbroadSelectGoodsViewCell * cell = [AbroadSelectGoodsViewCell new];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _tableView.frame = self.bounds;
}

@end
