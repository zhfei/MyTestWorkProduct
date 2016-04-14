//
//  ImageLabelViewController.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/3/11.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "ImageLabelViewController.h"
#import "Masonry.h"
#import "UIView+Image.h"
#import "ImageLabel.h"

@implementation ImageLabelViewController

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout
{
    UICollectionViewFlowLayout *flow  =[[UICollectionViewFlowLayout alloc]init];
    flow.minimumLineSpacing=10;
    flow.minimumInteritemSpacing=10;
    flow.sectionInset=UIEdgeInsetsMake(10, 10, 10, 10);
    flow.itemSize=CGSizeMake(100, 100);
    
    self=[super initWithCollectionViewLayout:flow];
    if (self) {
        [self.view setBackgroundColor:[UIColor whiteColor]];
        [self.collectionView setBackgroundColor:[UIColor whiteColor]];
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    NSLog(@"%d %d",11/10,11%10);
    
  

}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [cell.contentView setBackgroundColor:RGBACOLOR(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255), 1)];
    
    if ([cell.contentView.subviews count]) {
        [cell.contentView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj removeFromSuperview];
        }];
    }
   
    ImageLabel *imageL =[[ImageLabel alloc]init];
    imageL.index=indexPath.row;
    imageL.imageName=@"diacount_icon";
    [cell.contentView addSubview:imageL];
    [imageL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    if (indexPath.row==9) {
        UIView *imageV =[[UIView alloc]init];
        UIImage *image= [imageV createTextImageWithImageText:@"10" imageName:@"diacount_icon" textPosition:KPositionLeft];
      
        UIImageView *imagView =[[UIImageView alloc]initWithImage:image];
        imagView.contentMode=UIViewContentModeCenter;
        
        UILabel *label =[[UILabel alloc]init];
        label.text=@"hello world";
        
        [label addSubview:imagView];
        [imagView setFrame:CGRectMake(10, 10, image.size.width, image.size.height)];
        
        [cell.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsZero);
        }];
    }else if (indexPath.row==10) {
        UIView *imageV =[[UIView alloc]init];
        UIImage *image= [imageV imageFromTheView:[UIApplication sharedApplication].keyWindow];
        UIImageView *imagView =[[UIImageView alloc]initWithImage:image];
        imagView.contentMode=UIViewContentModeScaleAspectFit;
        [cell.contentView addSubview:imagView];
        [imagView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
//        [UIView addSimpleReflectionToView:imagView];
    }else if (indexPath.row==12) {
        UILabel *label =[[UILabel alloc]init];
        label.numberOfLines=0;
        label.backgroundColor=[UIColor lightGrayColor];
        label.text=@"hhhhfdkd，。&&ikjsad大陆我饿叫";
        CGAffineTransform matrix =  CGAffineTransformMake(1, 0, tanf(15 * (CGFloat)M_PI / 180), 1, 0, 0);
        UIFontDescriptor *desc = [ UIFontDescriptor fontDescriptorWithName :[ UIFont boldSystemFontOfSize:16 ]. fontName matrix :matrix];
        label.font= [ UIFont fontWithDescriptor :desc size :16];
//        label.font=[UIFont fontWithName:@"TrebuchetMS-Bold" size:18];
//        label.font=[UIFont systemFontOfSize:12];
        [cell.contentView addSubview:label];
//        [label mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerX.mas_equalTo(0);
//            make.centerY.mas_equalTo(0);
//            make.width.mas_equalTo(80);
//            make.height.mas_greaterThanOrEqualTo(20);
//        }];
//        label.center=cell.contentView.center;
        label.frame=CGRectMake(10, 10, 80, 80);
        NSLog(@"sizeToFit前、label.frame:%@",NSStringFromCGRect(label.frame));
        CGSize size= [label systemLayoutSizeFittingSize:CGSizeMake(80, MAXFLOAT)];
        label.frame=CGRectMake(10, 10, size.width, size.height);
        NSLog(@"sizeToFit后、label.frame:%@",NSStringFromCGRect(label.frame));
    }else if (indexPath.row==13) {
        UILabel *label =[[UILabel alloc]init];
        label.numberOfLines=2;
        label.backgroundColor=[UIColor lightGrayColor];
        
        NSTextAttachment *textAtt =[[NSTextAttachment alloc]init];
        textAtt.image=[UIImage imageNamed:@"starPress_"];
        NSAttributedString *attributed =[NSAttributedString attributedStringWithAttachment:textAtt];
        
        
        NSMutableParagraphStyle *paraM =[[NSMutableParagraphStyle alloc]init];
        paraM.firstLineHeadIndent=15;
        NSDictionary *attri =@{NSFontAttributeName:[UIFont systemFontOfSize:13],
                               NSParagraphStyleAttributeName:paraM};
        
        
        NSMutableAttributedString *attributed3=[[NSMutableAttributedString alloc]initWithString:@"桃花潭水深千尺，不及汪伦送我情。" attributes:attri];
        [attributed3 insertAttributedString:attributed atIndex:0];
        
        label.attributedText=attributed3;
        
        [cell.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(5, 5, 5, 5));
        }];
        
        
        
    }
    
    
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==9) {
        UICollectionViewCell *cell =[collectionView cellForItemAtIndexPath:indexPath];
        UILabel *label =[cell.contentView.subviews lastObject];
        NSLog(@"cell9%@",[label.subviews lastObject]);
        
        NSObject *test=nil;
        
        NSArray *array =@[@"hello",test,@"world"];
    }
}


@end
