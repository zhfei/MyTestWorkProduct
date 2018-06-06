//
//  TabBar2ViewController.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 15/11/3.
//  Copyright © 2015年 zhoufei. All rights reserved.
//

#import "TabBar2ViewController.h"
#import "SubScene1.h"
#import "NSString+UUID.h"

#import "AnimationScene2.h"
#import "SwizzingViewController.h"

#import "Utilities.h"
#import "UIButton+Method.h"
#import "Person.h"
#import "NSObject+ChainCoding.h"
#import "MyCollectionCell.h"
#import "CollectionViewController.h"
#import "CollectionViewHeaderViewController.h"
#import "AnimationViewController.h"
#import "TransitionAnimation.h"
#import "BluetoothViewController.h"
#import "PeripheralViewController.h"
#import "CentralViewController.h"
#import "BluetoothTransmissionViewController.h"
#import "LeftEdgeTitleViewController.h"
#import "GCDTestViewController.h"
#import "LocalFileReadingAndWritingVC.h"

#import "NSArray+Additions.h"
#import "SearchBarViewController.h"
#import "CalculatorManager.h"
#import "MyTestWorkProduct-Swift.h"

@interface TabBar2ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;
@property (strong,nonatomic)NSArray *dataSource;
@end

@implementation TabBar2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"CollectionView随机宽高布局";
     self.navigationController.tabBarItem.title=@"Collection";
    // Do any additional setup after loading the view from its nib.
    self.dataSource=@[@"FMDB数据库",@"HUD动画",@"swizzing",@"弹性列表",@"collection表头",@"动画",@"转场动画",@"蓝牙",@"外围服务",@"中心服务",@"左边缘标题",@"搜索条",@"GCD测试",@"读写本地数据流"];
    
//    NSDictionary *dict= [NSArray pinYinGroupSortWithArray:self.dataSource];
    
    UICollectionViewFlowLayout *flowLayout= [[UICollectionViewFlowLayout alloc]init];
    [self.myCollectionView setCollectionViewLayout:flowLayout];

    [self.myCollectionView setBackgroundColor:[UIColor whiteColor]];
    [self.myCollectionView registerNib:[UINib nibWithNibName:@"MyCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"MyCollectionCell"];
    
    //self.title=@"主题二";
    MyLog(@"path:%@",NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0]);
    
    UIButton *btn =[[UIButton alloc] init];
    
    [btn setImage:[UIImage imageNamed:@"a"] forState:UIControlStateNormal];
    
    [btn performSelector:@selector(eat:) withObject:@11];
    
    btn.name=@"123";
    NSLog(@"btn.name:%@",btn.name);
    
//    NSDictionary *dict =@{};
//    Person  *p =[[Person alloc]init];
//    
//    [p setValuesForKeysWithDictionary:dict];
//    
//    [NSObject zf_makeCalculat:^(CalculatorManager *manager) {
//        manager.add(2).add(2).add(2);
//    }];
//    
//    [p addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
//    
//    NSLog(@"%p",p);
    
    CalculatorManager *manager=[[CalculatorManager alloc]init];
    
    [[manager multiply:^int(int result) {
        
        result +=5;
        
        return result;
    }] result];
    
    SwiftViewController *swiftvc = [[SwiftViewController alloc]init];
    
    NSLog(@"%@",swiftvc);

}

- (void)eat:(NSNumber*)number {

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
   return CGSizeZero;
}

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSource.count;
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"MyCollectionCell";
    MyCollectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    [cell.contentView setBackgroundColor:RGBACOLOR(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255), 1)];
    
    
    cell.textV.text=self.dataSource[indexPath.row];
    
    return cell;
}
#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(arc4random_uniform(30)+60, arc4random_uniform(40)+50);
}
//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 25, 5, 25);
}
#pragma mark --UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        SubScene1 * subScene1=[[SubScene1 alloc]init];
        subScene1.index=indexPath.row;
        [self.navigationController pushViewController:subScene1 animated:YES];
    }else if(indexPath.row==1){
        AnimationScene2 *scene2 =[[AnimationScene2 alloc]init];
        [self.navigationController pushViewController:scene2 animated:YES];
    }else if (indexPath.row==2){
        SwizzingViewController *swizzing=[[SwizzingViewController alloc]init];
        [self.navigationController pushViewController:swizzing animated:YES];
    }else if (indexPath.row==3){
        CollectionViewController *collectionV=[[CollectionViewController alloc]init];
        [self.navigationController pushViewController:collectionV animated:YES];
    }else if (indexPath.row==4){
        CollectionViewHeaderViewController *collectionHeaderV=[[CollectionViewHeaderViewController alloc]init];
        [self.navigationController pushViewController:collectionHeaderV animated:YES];
    }else if (indexPath.row==5){
        AnimationViewController *animation=[[AnimationViewController alloc]initWithLayout];
        [self.navigationController pushViewController:animation animated:YES];

    }else if (indexPath.row==6){
        TransitionAnimation *animation=[[TransitionAnimation alloc]init];
        [self.navigationController pushViewController:animation animated:YES];
        
    }else if (indexPath.row==7){
        BluetoothViewController *bluetooth =[[BluetoothViewController alloc]init];
        [self.navigationController pushViewController:bluetooth animated:YES];
    }else if (indexPath.row==8){
        BluetoothTransmissionViewController*Peripheral=[[BluetoothTransmissionViewController alloc]init];
        [self.navigationController pushViewController:Peripheral animated:YES];
    }else if (indexPath.row==9){
        CentralViewController *Central=[[CentralViewController alloc]init];
        [self.navigationController pushViewController:Central animated:YES];
    }else if (indexPath.row==10){
        LeftEdgeTitleViewController *left =[[LeftEdgeTitleViewController alloc]initWithLayout];
        [self.navigationController pushViewController:left animated:YES];
    }else if (indexPath.row==11){
        SearchBarViewController *search =[[SearchBarViewController alloc]init];
        [self.navigationController pushViewController:search animated:YES];
    }else if (indexPath.row==12){
        GCDTestViewController *gcdTest =[[GCDTestViewController alloc]init];
        [self.navigationController pushViewController:gcdTest animated:YES];
    }else if (indexPath.row==13){
        LocalFileReadingAndWritingVC *ReadingAndWritingVC =[[LocalFileReadingAndWritingVC alloc]init];
        [self.navigationController pushViewController:ReadingAndWritingVC animated:YES];
    }
 
}
//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

@end
