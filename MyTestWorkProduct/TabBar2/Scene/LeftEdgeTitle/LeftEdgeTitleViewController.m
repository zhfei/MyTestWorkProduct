//
//  LeftEdgeTitleViewController.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/7/26.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "LeftEdgeTitleViewController.h"
#import "LeftEdgeCollectionViewCell.h"

static const int upTitleValue=200;
static const int downTitleValue=201;

static const int cellHeigh=50;
static const int cellWidth=80;
static const int upMarginDown=10;

@interface LeftEdgeTitleViewController()<UICollectionViewDelegate,UICollectionViewDataSource>
//上面
@property(strong,nonatomic)UICollectionView *upTitleCollectionView;
@property(strong,nonatomic)NSMutableArray *upDataSouce;

//下面
@property(strong,nonatomic)UICollectionView *downTitleCollectionView;
@property(strong,nonatomic)NSMutableArray *downDataSouce;

@end

@implementation LeftEdgeTitleViewController

- (instancetype)initWithLayout
{
    self = [super init];
    if (self) {
        
        UICollectionViewFlowLayout *flow =[[UICollectionViewFlowLayout alloc]init];
        flow.itemSize=CGSizeMake(cellWidth, cellHeigh);
        flow.minimumLineSpacing=upMarginDown;
        flow.minimumInteritemSpacing=0;
        flow.scrollDirection=UICollectionViewScrollDirectionVertical;

        self.upTitleCollectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 100, 100) collectionViewLayout:flow];
        self.downTitleCollectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 100, 100) collectionViewLayout:flow];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //上面
    self.upTitleCollectionView.delegate=self;
    self.upTitleCollectionView.dataSource=self;
    self.upTitleCollectionView.showsVerticalScrollIndicator=NO;
    self.upTitleCollectionView.tag=upTitleValue;
    [self.view addSubview:self.upTitleCollectionView];
    
    self.upDataSouce=[NSMutableArray arrayWithObjects:@"选桌",@"消息",@"核销",@"会员", nil];
    
    
    //下面
    self.downTitleCollectionView.delegate=self;
    self.downTitleCollectionView.dataSource=self;
    self.downTitleCollectionView.showsVerticalScrollIndicator=NO;
    self.downTitleCollectionView.tag=downTitleValue;
    [self.view addSubview:self.downTitleCollectionView];
    self.downDataSouce=[NSMutableArray arrayWithObjects:@"统计",@"设置",@"后台管理",@"操作员001", nil];
    
    //设置上下两个选项视图的高度
    CGFloat upHeigh=[self.upDataSouce count]*cellHeigh+([self.upDataSouce count]-1)*upMarginDown;
    CGFloat downHeigh=[self.downDataSouce count]*50+([self.downDataSouce count]-1)*upMarginDown;
    
    if (upHeigh+downHeigh>self.view.height) {
        upHeigh=self.view.height/2;
        downHeigh=upHeigh;
    }
    
    [self.upTitleCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(cellWidth);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(upHeigh);
    }];

    [self.downTitleCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(cellWidth);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(downHeigh);
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.upTitleCollectionView registerClass:[LeftEdgeCollectionViewCell class] forCellWithReuseIdentifier:@"LeftEdgeCollectionViewCell"];
    [self.upTitleCollectionView setBackgroundColor:[UIColor lightGrayColor]];
   
    [self.downTitleCollectionView registerClass:[LeftEdgeCollectionViewCell class] forCellWithReuseIdentifier:@"LeftEdgeCollectionViewCell"];
    [self.downTitleCollectionView setBackgroundColor:[UIColor lightGrayColor]];
    
}

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (collectionView.tag==upTitleValue) {
        return  [self.upDataSouce count];
    }else{
        return  [self.downDataSouce count];
    }
    
    return 0;
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"LeftEdgeCollectionViewCell";
    LeftEdgeCollectionViewCell * cell = (LeftEdgeCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (collectionView.tag==upTitleValue) {
        [cell setTitle:self.upDataSouce[indexPath.row]];
    }else{
        [cell setTitle:self.downDataSouce[indexPath.row]];
    }
   
    
    return cell;
}




@end
