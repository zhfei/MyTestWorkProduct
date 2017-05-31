//
//  ShoppingVC.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/25.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "ShoppingVC.h"
#import "ClassifyTableViewController.h"
#import "CommodityListViewController.h"
#import "ShoppingCartBar.h"

#import <Masonry/Masonry.h>

static CGFloat meanWidth = 80;
static CGFloat shoppingCartBarHeigh = 60;

@interface ShoppingVC ()

@property (strong,nonatomic)CommodityListViewController *commodityListVC;
@property (strong,nonatomic)ClassifyTableViewController *classifyTableVC;

@end

@implementation ShoppingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.edgesForExtendedLayout=UIRectEdgeNone;
    self.title = @"点单";
    
    [self resetSubViewController];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)resetSubViewController {
    
    ShoppingCartBar * shoppingCartBar = [ShoppingCartBar sharedShoppingCartBar];
    [self.view addSubview:shoppingCartBar];
    [shoppingCartBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.bottom.mas_equalTo(0);
        make.height.mas_equalTo(shoppingCartBarHeigh);
    }];
    
    CGFloat commodityListWidth = [UIScreen mainScreen].bounds.size.width - meanWidth;

    self.classifyTableVC = [ClassifyTableViewController new];
    [self addChildViewController:_classifyTableVC];
    [self.view addSubview:_classifyTableVC.view];
    [_classifyTableVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.mas_equalTo(0);
        make.width.mas_equalTo(meanWidth);
        make.bottom.mas_equalTo(shoppingCartBar.mas_top);
    }];
    
    self.commodityListVC = [CommodityListViewController new];
    [self addChildViewController:_commodityListVC];
    [self.view addSubview:_commodityListVC.view];
    [_commodityListVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.and.top.mas_equalTo(0);
        make.width.mas_equalTo(commodityListWidth);
        make.bottom.mas_equalTo(shoppingCartBar.mas_top);
    }];
    
    
    
    UIButton * titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [titleBtn setTitle:@"点单" forState:UIControlStateNormal];
    [titleBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    self.navigationItem.titleView = titleBtn;
    
    UIButton * memberBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [memberBtn setBounds:CGRectMake(0, 0, 44, 44)];
    [memberBtn setTitle:@"会员" forState:UIControlStateNormal];
    [memberBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:memberBtn];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
