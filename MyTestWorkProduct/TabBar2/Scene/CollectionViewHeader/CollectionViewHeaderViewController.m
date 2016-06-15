//
//  CollectionViewHeaderViewController.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/6/6.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "CollectionViewHeaderViewController.h"
#import "CollectionViewHeaderCell.h"
#import "CollectionViewHeader.h"

#import "LeftAlignedFlowLayout.h"

@implementation CollectionViewHeaderViewController
- (instancetype)init
{
    LeftAlignedFlowLayout *flowLayout= [[LeftAlignedFlowLayout alloc]init];
    [flowLayout configLeftAlignedFlowLayoutWithLeftMargin:20 ItemMargin:20];
    flowLayout.itemSize=CGSizeMake(100, 40);
    flowLayout.sectionInset=UIEdgeInsetsMake(20, 20, 20, 20);
    
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
    
    [self.collectionView setBackgroundColor:RGBACOLOR(251, 251, 251, 1)];
    [self.collectionView registerClass:[CollectionViewHeaderCell class] forCellWithReuseIdentifier:@"CollectionViewHeaderCell"];
    [self.collectionView registerClass:[CollectionViewHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CollectionViewHeader"];
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
    return CGSizeMake(collectionView.bounds.size.width-40, 50);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView*collectionHeader= [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CollectionViewHeader" forIndexPath:indexPath];
    
    return collectionHeader;
}

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 10;
}
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"CollectionViewHeaderCell";
    CollectionViewHeaderCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
//    [cell setBackgroundColor:RGBACOLOR(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255), 1)];
    [cell.btn setTitle:@"展示的内容" forState:UIControlStateNormal];
    
    
    return cell;
}
@end
