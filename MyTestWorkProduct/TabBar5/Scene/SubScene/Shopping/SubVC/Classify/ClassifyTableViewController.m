//
//  ClassifyTableViewController.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/25.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "ClassifyTableViewController.h"
#import "ClassifyCell.h"

static NSString * reuseIdentifier = @"ClassifyCell";

@interface ClassifyTableViewController ()
@property (strong,nonatomic)NSArray * dataSource;
@end

@implementation ClassifyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = NO;
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.tableView registerNib:[UINib nibWithNibName:@"ClassifyCell" bundle:nil] forCellReuseIdentifier:reuseIdentifier];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.dataSource = @[@"搜索",@"水果",@"炒菜",@"冷菜",@"推荐",@"特色"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ClassifyCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.title.text = self.dataSource[indexPath.row];

    return cell;
}


@end
