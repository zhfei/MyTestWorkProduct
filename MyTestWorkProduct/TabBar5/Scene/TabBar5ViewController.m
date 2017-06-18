//
//  TabBar5ViewController.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 15/11/3.
//  Copyright © 2015年 zhoufei. All rights reserved.
//

#import "TabBar5ViewController.h"
#import "XFileManager.h"
#import "SingletonViewController.h"
#import "DateFormatterTableVC.h"
#import "ZFObject.h"
#import "DispatchGroupVC.h"
#import "ImageCachePool.h"
#import "DesignModeVC.h"
#import "DecouplingManyVCsVC.h"
#import "DecouplingVC.h"
#import "ShoppingVC.h"
#import "ZFButtonViewController.h"

@interface TabBar5ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    ImageCachePool * imageCachePool;
}
@property(nonatomic,retain)UIActivityIndicatorView *act;

@property (strong,nonatomic) NSArray     *dataSource;
@property (weak, nonatomic ) IBOutlet UITableView *tableView;
@property (strong,nonatomic) ImageCachePool     *imageCachePool;

@end

@implementation TabBar5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    self.navigationController.tabBarItem.title=@"Collection";
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    NSString *path= [[NSBundle mainBundle] pathForResource:@"TabBar5" ofType:@"plist"];
    self.dataSource=[NSArray arrayWithContentsOfFile:path];
    
    NSString *dateString=@"2017-02-23 08:07:40 +0000";
    NSDateFormatter *format=[[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    NSDate * value=[format dateFromString:dateString];
    
//    NSData *data= [NSJSONSerialization dataWithJSONObject:value options:NSJSONWritingPrettyPrinted error:nil];
    
    
    NSLog(@"%@:----%@",NSStringFromSelector(_cmd),value);
    
    
    ZFObject *obj =[ZFObject zfObjectWith:nil];
    [obj.changePropertiesDict setObject:@"南京" forKey:@"address"];
    [obj updateObjectUsingChangePropertiesDict];
    MyLog(@"obj:%@",obj.address)

    
}

- (void)imageCachePoolTest {

    imageCachePool = [ImageCachePool sharedImageCachePool];

    {
        UIImage * image1 = [imageCachePool imageNamed:@"afr-1" fromBundle:nil];
        
        UIImage * image2 = [imageCachePool imageNamed:@"afr-1" fromBundle:nil];
        
        MyLog(@"obj:%p, %p",image1,image2);
    }
    
    
    UIImage * image3 = [imageCachePool imageNamed:@"afr-1" fromBundle:nil];
    
    UIImage * image4 = [imageCachePool imageNamed:@"afr-1" fromBundle:nil];
    
    MyLog(@"obj:%p, %p",image3,image4);

}


- (void)setTableView {

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

- (void)setActivityView {
    
    UIView *bg =[[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    bg.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    
    self.act=[[UIActivityIndicatorView  alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    //设置 风格;
    self.act.activityIndicatorViewStyle=UIActivityIndicatorViewStyleWhiteLarge;
    //设置活动指示器的颜色
    //    self.act.color=[UIColor blueColor];
    //hidesWhenStopped默认为YES，会隐藏活动指示器。要改为NO
    self.act.hidesWhenStopped=YES;
    //启动
    [self.act startAnimating];
    
    //停止
    //    [self.act stopAnimating];
    [bg addSubview:self.act];
    [self.view addSubview:bg];
    
    [self.act performSelector:@selector(stopAnimating) withObject:nil afterDelay:5];
    
    NSArray *testArray=@[@"0",@"1",@"2",@"3",@"4",@"5"];
    NSMutableArray *testAM=[NSMutableArray arrayWithArray:testArray];
    
    [testAM removeObjectAtIndex:1];
    id obj=[testAM objectAtIndex:1];
    NSLog(@"obj:%@",obj);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.dataSource.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];

    if (!cell) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    
    
    
    cell.textLabel.text=self.dataSource[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0: {
            SingletonViewController *svc=[[SingletonViewController alloc]init];
            [self.navigationController pushViewController:svc animated:YES];
        }
            break;
        case 1: {
            DateFormatterTableVC *dft=[[DateFormatterTableVC alloc]init];
            [self.navigationController pushViewController:dft animated:YES];
        }
            break;
        case 2: {
            DispatchGroupVC * dgvc=[[DispatchGroupVC alloc]init];
            [self.navigationController pushViewController:dgvc animated:YES];
        }
            break;
        case 3: {
            DesignModeVC * dmvc=[[DesignModeVC alloc]init];
            [self.navigationController pushViewController:dmvc animated:YES];
        }
            break;
        case 4: {
            DecouplingManyVCsVC * dmvcs=[[DecouplingManyVCsVC alloc]init];
            [self.navigationController pushViewController:dmvcs animated:YES];
        }
            break;
        case 5: {
            DecouplingVC * dvc=[[DecouplingVC alloc]init];
            [self.navigationController pushViewController:dvc animated:YES];
        }
            break;
        case 6: {
            ShoppingVC * sp=[[ShoppingVC alloc]init];
            sp.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:sp animated:YES];
        }
            break;
        case 7: {
            ZFButtonViewController * btnVC=[[ZFButtonViewController alloc]init];
            [self.navigationController pushViewController:btnVC animated:YES];
        }
            break;
            
            
            
            
        default:
            break;
    }
}

@end
