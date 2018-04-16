//
//  AbroadShoppingHomeViewController.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/12/18.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "AbroadShoppingHomeViewController.h"
#import "AbroadShoppingHomePresenter.h"
#import "AbroadShoppingHomeViewModel.h"
#import "AbroadShoppingHomeView.h"

@interface AbroadShoppingHomeViewController ()

@property (nonatomic,strong) AbroadShoppingHomePresenter * abroadshoppinghomePresenter;
@property (nonatomic,strong) AbroadShoppingHomeViewModel * abroadshoppinghomeViewModel;
@property (nonatomic,strong) AbroadShoppingHomeView * abroadshoppinghomeView;

@end


@implementation AbroadShoppingHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"全球购";
    [self setupView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self adapterView];
}

- (AbroadShoppingHomePresenter *)abroadshoppinghomePresenter {
    
    if (!_abroadshoppinghomePresenter) {
        _abroadshoppinghomePresenter = [AbroadShoppingHomePresenter new];
    }
    return _abroadshoppinghomePresenter;
}

- (AbroadShoppingHomeViewModel *)abroadshoppinghomeViewModel {
    
    if (!_abroadshoppinghomeViewModel) {
        _abroadshoppinghomeViewModel = [AbroadShoppingHomeViewModel new];
    }
    return _abroadshoppinghomeViewModel;
}

- (AbroadShoppingHomeView *)abroadshoppinghomeView {
    
    if (!_abroadshoppinghomeView) {
        _abroadshoppinghomeView = [AbroadShoppingHomeView new];
        _abroadshoppinghomeView.frame = self.view.bounds;
    }
    return _abroadshoppinghomeView;
}

- (void)setupView {
    [self.view addSubview:self.abroadshoppinghomeView];
}

- (void)adapterView {
    [self.abroadshoppinghomePresenter adapterWithAbroadShoppingHomeView:self.abroadshoppinghomeView abroadshoppinghomeViewModel:self.abroadshoppinghomeViewModel];
}

@end
