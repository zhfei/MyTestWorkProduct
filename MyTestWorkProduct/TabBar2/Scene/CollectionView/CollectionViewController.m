//
//  CollectionViewController.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/6/2.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"

#import "BoundFlowLayout.h"

@interface CollectionViewController()
@property (strong,nonatomic)NSArray *dataSource;

@end

@implementation CollectionViewController

- (instancetype)init
{
    BoundFlowLayout *flowLayout= [[BoundFlowLayout alloc]init];
//    flowLayout.itemSize=CGSizeMake(ScreenWidth-40, 100);
    flowLayout.minimumLineSpacing=20;
    flowLayout.minimumInteritemSpacing=20;
//    flowLayout.sectionInset=UIEdgeInsetsMake(10, 10, 10, 10);
    
    self = [super initWithCollectionViewLayout:flowLayout];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.edgesForExtendedLayout=UIRectEdgeNone;
    
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"CollectionViewCell"];
    
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
    return 1;
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 20;
}
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"CollectionViewCell";
    CollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    [cell.contentView setBackgroundColor:RGBACOLOR(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255), 1)];
    cell.label.text=@"展示的内容";
    
    
    return cell;
}
#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //return CGSizeMake(arc4random_uniform(30)+60, arc4random_uniform(40)+50);
    return CGSizeMake(ScreenWidth-40, 50);
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
    
    
}
//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
@end
