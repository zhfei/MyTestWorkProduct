//
//  AnimationViewController.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/6/21.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "AnimationViewController.h"
#import "UIColor+Hexadecimal.h"

@implementation AnimationViewController

- (instancetype)initWithLayout
{
    UICollectionViewFlowLayout *flowLayout =[[UICollectionViewFlowLayout alloc]init];
    flowLayout.minimumLineSpacing=20;
    flowLayout.minimumInteritemSpacing=30;
    flowLayout.sectionInset=UIEdgeInsetsMake(100, 20, 100, 20);
    flowLayout.itemSize=CGSizeMake(300, 300);
    flowLayout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    
    self=[super initWithCollectionViewLayout:flowLayout];
    if (self) {
        
    }
    
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

//活动指示器动画
-(UIActivityIndicatorView *)activityIndicatorAnimation
{
    UIActivityIndicatorView *activityAnimation=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [activityAnimation setBounds:CGRectMake(0, 0, 300, 300)];
    
    [activityAnimation startAnimating];
    [activityAnimation setHidesWhenStopped:YES];
    
    return activityAnimation;
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    [cell.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];

    
    [cell setBackgroundColor:[UIColor randomColor]];
    
    if (indexPath.row==0) {
        
        UIView *view=[self activityIndicatorAnimation];
        [cell addSubview:view];
        view.center=CGPointMake(150, 150);
        
    }else if (indexPath.row==1){

        UIView *block=[UIView new];
        
        [block setFrame:CGRectMake(0, 0, 50, 50)];
        [block setBackgroundColor:[UIColor blueColor]];
        
        [UIView animateWithDuration:1 delay:1 options:UIViewAnimationOptionRepeat animations:^{
            [block setFrame:CGRectMake(200, 250, 30, 50)];
            [block setBackgroundColor:[UIColor redColor]];
        } completion:^(BOOL finished) {
            
        }];
        
        [cell addSubview:block];
    }else if (indexPath.row==2){
        
        UIView *block=[UIView new];
        [block setFrame:CGRectMake(0, 0, 50, 50)];
        [block setBackgroundColor:[UIColor blueColor]];
        [cell addSubview:block];

        [UIView animateKeyframesWithDuration:3 delay:0 options:UIViewKeyframeAnimationOptionBeginFromCurrentState animations:^{
            
            [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1/3.0 animations:^{
                [block setFrame:CGRectMake(200, 250, 30, 50)];
                [block setBackgroundColor:[UIColor redColor]];
            }];
            [UIView addKeyframeWithRelativeStartTime:1/3.0 relativeDuration:2/3.0 animations:^{
                [block setFrame:CGRectMake(250, 10, 30, 50)];
                [block setBackgroundColor:[UIColor yellowColor]];
            }];
                    
        } completion:^(BOOL finished) {
            
        }];
        
    }else if (indexPath.row==3){
        
        UIView *block=[UIView new];
        [block setFrame:CGRectMake(0, 0, 50, 50)];
        [block setBackgroundColor:[UIColor blueColor]];
        [cell addSubview:block];
        
        [UIView animateWithDuration:3 delay:0 usingSpringWithDamping:0.1 initialSpringVelocity:0.9 options:UIViewAnimationOptionRepeat animations:^{
            [block setFrame:CGRectMake(200, 150, 30, 50)];
            [block setBackgroundColor:[UIColor redColor]];
        } completion:^(BOOL finished) {
            
        }];
        
    }else if (indexPath.row==4){
        
        UIView *view =[UIView new];
        view.bounds=CGRectMake(0, 0, 100, 100);
        
        [cell addSubview:view];
        view.center=CGPointMake(150, 150);
        
        view.layer.backgroundColor=[UIColor purpleColor].CGColor;
        view.layer.cornerRadius=3;
        view.layer.borderColor=[UIColor blueColor].CGColor;
        view.layer.borderWidth=2;
        
        view.layer.shadowOffset=CGSizeMake(5, 5);
        view.layer.shadowColor=[UIColor yellowColor].CGColor;
        view.layer.shadowRadius=5;
        view.layer.shadowOpacity=1;
        
       
        [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionRepeat animations:^{
//            view.layer.transform=CATransform3DMakeScale(0, 0, 0);
            view.layer.transform=CATransform3DRotate(view.layer.transform, M_PI, 1, 1, 1);
//            view.layer.transform=CATransform3DMakeTranslation(100, 100, 0);

        } completion:^(BOOL finished) {
            
        }];//
        
    }else if (indexPath.row==5){
        
        CFAbsoluteTime start=CFAbsoluteTimeGetCurrent();
        UIImageView *view =[UIImageView new];
        view.frame=CGRectMake(0, 0, 300, 300);
        
        view.image=[UIImage imageNamed:@"paopao"];
        view.contentMode=UIViewContentModeScaleAspectFit;
        [cell addSubview:view];
        
        CFAbsoluteTime end=CFAbsoluteTimeGetCurrent();

        NSLog(@"start:%.3f------end:%.3f-------%.3f",start,end,end-start);
//        CATransition *trans=[CATransition animation];
//        trans.type=@"pageCurl";
//        trans.duration=2;
//        [view.layer addAnimation:trans forKey:nil];
        
        [UIView transitionWithView:view duration:2 options:UIViewAnimationOptionRepeat animations:^{
            
        } completion:^(BOOL finished) {
            
        }];
        
        
    }

    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        UICollectionViewCell *cell =[collectionView cellForItemAtIndexPath:indexPath];
        UIActivityIndicatorView *activityAnimation=[cell.subviews lastObject];
        
        if (activityAnimation.isAnimating) {
            [activityAnimation stopAnimating];
        }else{
            [activityAnimation startAnimating];

        }
    }
}


@end
