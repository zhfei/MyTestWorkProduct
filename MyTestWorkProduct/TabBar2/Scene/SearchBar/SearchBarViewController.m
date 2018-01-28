//
//  SearchBarViewController.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/8/22.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "SearchBarViewController.h"
#import "Masonry.h"

@interface SearchBarViewController ()<UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation SearchBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.searchBar.delegate=self;
    [self.searchBar setBounds:CGRectMake(0, 0, 100, 50)];

}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

//    [self.view setBackgroundColor:[UIColor blueColor]];
//    UIView *bg= [self.view snapshotViewAfterScreenUpdates:NO];
    
//    UIView *bg= [self snapshotView:self.view];
//
//    [self.view addSubview:bg];
//    [bg setFrame:CGRectMake(0, 100, 100, 100)];
    [self gcdGroupAction];
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

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
   searchBar.text=@"hello";
}

- (UIView *)snapshotView:(UIView *)view{

    CGRect bonds=view.bounds;
    
    UIGraphicsBeginImageContext(bonds.size);
    CGContextRef ctx =UIGraphicsGetCurrentContext();
    
    [view.layer renderInContext:ctx];
    
    UIImage *image= UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    UIView *v =[UIView new];
    v.layer.contents=(__bridge id _Nullable)(image.CGImage);
    
    return v;
    
}


- (void)gcdGroupAction{

    dispatch_group_t group =dispatch_group_create();
    dispatch_queue_t queue= dispatch_get_global_queue(0, 0);
    
    dispatch_group_async(group, queue, ^{
        for (int i=0; i<10; i++) {
            [NSThread sleepForTimeInterval:0.5];
            NSLog(@"opention1:%@",[NSThread currentThread]);
        }
        NSLog(@"opention1结束-----");
    });
    dispatch_group_async(group, queue, ^{
        for (int i=0; i<10; i++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"opention2:%@",[NSThread currentThread]);
        }
        NSLog(@"opention2结束-----");
    });
    dispatch_group_async(group, queue, ^{
        for (int i=0; i<10; i++) {
            [NSThread sleepForTimeInterval:1.5];
            NSLog(@"opention3:%@",[NSThread currentThread]);
        }
        NSLog(@"opention3结束-----");
    });
    dispatch_group_async(group, queue, ^{
        for (int i=0; i<10; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"opention4:%@",[NSThread currentThread]);
        }
        NSLog(@"opention4结束-----");
    });
    
    dispatch_group_notify(group, queue, ^{
        NSLog(@"所有操作都完成了-----:%@",[NSThread currentThread]);
    });
}



@end
