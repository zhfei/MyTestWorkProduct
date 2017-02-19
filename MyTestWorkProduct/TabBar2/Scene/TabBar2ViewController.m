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
#import "Utilities.h"
#import "UIButton+Method.h"
#import "Person.h"
#import "NSObject+ChainCoding.h"

@interface TabBar2ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;

@end

@implementation TabBar2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UICollectionViewFlowLayout *flowLayout= [[UICollectionViewFlowLayout alloc]init];
    [self.myCollectionView setCollectionViewLayout:flowLayout];

    [self.myCollectionView setBackgroundColor:[UIColor whiteColor]];
    [self.myCollectionView registerNib:[UINib nibWithNibName:@"MyCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"MyCollectionCell"];
    
    //self.title=@"主题二";
    MyLog(@"path:%@",NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0]);
    
    UIButton *btn =[[UIButton alloc] initMethod];
    
    [btn setImage:[UIImage imageNamed:@"a"] forState:UIControlStateNormal];
    
    [btn performSelector:@selector(eat:) withObject:@11];
    
    btn.name=@"123";
    NSLog(@"btn.name:%@",btn.name);
    
    NSDictionary *dict =@{};
    Person  *p =[[Person alloc]init];
    
    [p setValuesForKeysWithDictionary:dict];
    
    [NSObject zf_makeCalculat:^(CalculatorManager *manager) {
        manager.add(2).add(2).add(2);
    }];
    
    [p addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    
    NSLog(@"%p",p);
    
    CalculatorManager *manager=[[CalculatorManager alloc]init];
    
    [[manager multiply:^int(int result) {
        
        result +=5;
        
        return result;
    }] result];
    
    
    
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
    return 30;
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"MyCollectionCell";
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    [cell.contentView setBackgroundColor:RGBACOLOR(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255), 1)];
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
    }else{
        AnimationScene2 *scene2 =[[AnimationScene2 alloc]init];
        [self.navigationController pushViewController:scene2 animated:YES];
    }
    
    
}
//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

@end
