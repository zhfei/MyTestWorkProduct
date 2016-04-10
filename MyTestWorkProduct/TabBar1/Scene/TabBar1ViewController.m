//
//  TabBar1ViewController.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 15/11/3.
//  Copyright © 2015年 zhoufei. All rights reserved.
//

#import "TabBar1ViewController.h"
#import "ImageLabelViewController.h"
#import "Masonry.h"
#import "CircleProgressViewController.h"
#import "UIImageView+WebCache.h"
#import "DIYCollectionViewLayoutViewController.h"
#import "DIYDownLoadProgressViewController.h"
#import "VideoPlayerViewController.h"
#import "FontSettingsViewController.h"
#import "MapViewController.h"
#import "AutoLayoutAnimViewController.h"
#import "CellAutoHeightViewController.h"

@interface TabBar1ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;


@property (strong,nonatomic)NSMutableArray *dataSource;


@end

@implementation TabBar1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title=@"UITableView相关的测试用例";
    
    
    self.navigationController.tabBarItem.title=@"Table";
    self.myTableView.separatorInset=UIEdgeInsetsMake(0, 0, 0, 0);
   
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.dataSource=[NSMutableArray arrayWithObjects:@"drawRect绘画",@"圆形进度条",@"自定义UICollectionViewLayout",@"自定义下载进度条",@"视频播放器",@"字体设置",@"地图",@"自动布局动画",@"Cell自适应高度",@"小树", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{

    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UILabel *headerLabel =[[UILabel alloc]init];
    headerLabel.textAlignment=NSTextAlignmentCenter;
    headerLabel.text=[NSString stringWithFormat:@"这是第%li个Header",(long)section];
    headerLabel.textColor=[UIColor whiteColor];
    headerLabel.font=[UIFont systemFontOfSize:20];
    headerLabel.layer.borderWidth=1;
    headerLabel.layer.borderColor=[UIColor lightGrayColor].CGColor;
    headerLabel.layer.masksToBounds=YES;
    [headerLabel setBackgroundColor:RGBACOLOR(108, 203, 222, 1)];
    
    
    return headerLabel;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UILabel *footerLabel =[[UILabel alloc]init];
    footerLabel.textAlignment=NSTextAlignmentCenter;
    footerLabel.text=[NSString stringWithFormat:@"这是第%li个Footer",(long)section];
    footerLabel.textColor=[UIColor whiteColor];
    footerLabel.font=[UIFont systemFontOfSize:20];
    footerLabel.layer.borderWidth=1;
    footerLabel.layer.borderColor=[UIColor lightGrayColor].CGColor;
    footerLabel.layer.masksToBounds=YES;
    [footerLabel setBackgroundColor:[UIColor lightGrayColor]];
    
    return footerLabel;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataSource count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID =@"myCell";//http://7xqkjm.com1.z0.glb.clouddn.com/ZF_Header_01.png
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        cell.imageView.layer.borderColor=[UIColor lightGrayColor].CGColor;
        cell.imageView.layer.borderWidth=1;
        cell.imageView.layer.masksToBounds=YES;
        cell.imageView.layer.cornerRadius=30;
    }
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@ZF_Header_0%li.png",API_HOST,arc4random_uniform(8)+1]] placeholderImage:[UIImage imageNamed:@"我的互动-消息提示_10"]];
    
    
    
    cell.textLabel.text=[self.dataSource objectAtIndex:indexPath.row];
    if (indexPath.row>8) {
        cell.detailTextLabel.text=@"春眠不觉晓、处处闻啼鸟。";

    }
    
    //po cell.recursiveDescription, 打印cell中的子视图结构图。
    
    
    return cell;
}


#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.section) {
        case 0:
        {
            switch (indexPath.row) {
                case 0:
                {
                    ImageLabelViewController *imageLabelVC =[[ImageLabelViewController alloc]initWithCollectionViewLayout:nil];
                    imageLabelVC.title=[tableView cellForRowAtIndexPath:indexPath].textLabel.text;
                    [self.navigationController pushViewController:imageLabelVC animated:YES];
                }
                    break;
                case 1:
                {
                    CircleProgressViewController *circle =[[CircleProgressViewController alloc]init];
                    [self.navigationController pushViewController:circle animated:YES];
                }
                    break;
                case 2:
                {
                    DIYCollectionViewLayoutViewController *diyLayout =[[DIYCollectionViewLayoutViewController alloc]initWitDefontLayout];
                    [self.navigationController pushViewController:diyLayout animated:YES];
                }
                    break;
                    case 3:
                {
                    DIYDownLoadProgressViewController *downLoad =[[DIYDownLoadProgressViewController alloc]init];
                    [self.navigationController pushViewController:downLoad animated:YES];
                }
                    break;
                    case 4:
                {
                    VideoPlayerViewController *video =[[VideoPlayerViewController alloc]init];
                    [self.navigationController pushViewController:video animated:YES];
                }
                    break;
                    case 5:
                {
                    FontSettingsViewController *fontSetting=[[FontSettingsViewController alloc]init];
                    [self.navigationController pushViewController:fontSetting animated:YES];
                }
                    break;
                    case 6:
                {
                    MapViewController *map =[[MapViewController alloc]init];
                    [self.navigationController pushViewController:map animated:YES];
                }
                    break;
                    case 7:
                {
                    AutoLayoutAnimViewController *layoutAnim =[[AutoLayoutAnimViewController alloc]init];
                    [self.navigationController pushViewController:layoutAnim animated:YES];
                }
                    break;
                    case 8:
                {
                    CellAutoHeightViewController *cellAuto =[[CellAutoHeightViewController alloc] init];
                    [self.navigationController pushViewController:cellAuto animated:YES];
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
        case 1:
        {
        
        }
            break;
            
        default:
            break;
    }
    
}



@end