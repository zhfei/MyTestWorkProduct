//
//  DesignModeVC.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/6.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "DesignModeVC.h"
#import "CarLicenseFactory.h"
#import "BlueCarLicenseFactory.h"
#import "YellowCarLicenseFactory.h"
#import "AtBeiJingCarLicenseFactory.h"
#import "AdapterPlayerVC.h"
#import "StrategyPlayerVC.h"
#import "TemplateVC.h"

@interface DesignModeVC ()<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic)NSArray * dataSource;
@end

@implementation DesignModeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"设计模式";
    
    self.dataSource = @[@"简单工厂模式",
                        @"工厂模式",
                        @"抽象工厂模式",
                        @"适配器",
                        @"策略模式",
                        @"模版模式"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.01;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID =@"myCell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = self.dataSource[indexPath.row];
    
    return cell;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            [self simpleFactoryTest];
        }
            break;
        case 1:
        {
            [self factoryTest];
        }
            break;
        case 2:
        {
            [self abstractFactoryTest];
        }
            break;
        case 3:
        {
            [self adapterTest];
        }
            break;
        case 4:
        {
            [self strategyTest];
        }
            break;
        case 5:
        {
            [self templateTest];
        }
            break;
        default:
            break;
    }
}

#pragma mark - TestFunction
/*!**简单工厂模式***/
- (void)simpleFactoryTest {

    CarLicense *blue = [CarLicenseFactory createCarLicenseWithCarLicenseType:CarLicenseBlue];
    blue.city = @"京";
    NSLog(@"blue:%@",[blue printCarLicenseNumber]);
    
    CarLicense *yellow = [CarLicenseFactory createCarLicenseWithCarLicenseType:CarLicenseYellow];
    yellow.city = @"京";
    NSLog(@"yellow:%@",[yellow printCarLicenseNumber]);
}

/*!**工厂模式***/
- (void)factoryTest {

    CarLicense * blue = [BlueCarLicenseFactory createCarLicense];
    blue.city = @"京";
    NSLog(@"blue:%@",[blue printCarLicenseNumber]);

    CarLicense * yellow = [YellowCarLicenseFactory createCarLicense];
    yellow.city = @"京";
    NSLog(@"yellow:%@",[yellow printCarLicenseNumber]);
}

/*!**抽象工厂模式***/
- (void)abstractFactoryTest {

    
    CarLicense * yellow = [AtBeiJingCarLicenseFactory createYellowCarLicense];
    NSLog(@"北京黄车牌：%@",[yellow printCarLicenseNumber]);
    
    CarLicense * blue = [AtBeiJingCarLicenseFactory createBlueCarLicense];
    NSLog(@"北京蓝车牌：%@",[blue printCarLicenseNumber]);
    
}

/*!**适配器***/
- (void)adapterTest {

    AdapterPlayerVC * adapter = [AdapterPlayerVC new];
    [self.navigationController pushViewController:adapter animated:YES];
}

/*!**策略模式***/
- (void)strategyTest {
    
    StrategyPlayerVC * adapter = [StrategyPlayerVC new];
    [self.navigationController pushViewController:adapter animated:YES];
}

/*!**模版模式***/
- (void)templateTest {
    
    TemplateVC * template = [TemplateVC new];
    [self.navigationController pushViewController:template animated:YES];
}


@end
