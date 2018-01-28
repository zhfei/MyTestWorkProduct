//
//  CommodityListViewController.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/25.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "CommodityListViewController.h"
#import "CommodityCell.h"
//#import "ShoppingCartAnimation.h"

@interface CommodityListViewController ()
@property (strong,nonatomic)NSArray * dataSource;
@end

@implementation CommodityListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
    [self.tableView registerNib:[UINib nibWithNibName:@"CommodityCell" bundle:nil] forCellReuseIdentifier:@"CommodityCell"];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    self.dataSource = @[@"土豆",@"黄瓜",@"西红柿",@"西葫芦",@"莲藕",@"大白菜"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 105;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CommodityCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommodityCell" forIndexPath:indexPath];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

//    CommodityCell *cell = [tableView cellForRowAtIndexPath:indexPath];
}



@end
