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

@interface TabBar5ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,retain)UIActivityIndicatorView *act;

@property (strong,nonatomic)NSArray *dataSource;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TabBar5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    NSString *path= [[NSBundle mainBundle] pathForResource:@"TabBar5" ofType:@"plist"];
   
    self.dataSource=[NSArray arrayWithContentsOfFile:path];
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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
    
    if (indexPath.row==0) {
        SingletonViewController *svc=[[SingletonViewController alloc]init];
        [self.navigationController pushViewController:svc animated:YES];
    }

}

@end
