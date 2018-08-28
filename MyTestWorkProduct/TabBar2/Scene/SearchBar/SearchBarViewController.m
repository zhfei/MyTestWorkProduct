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
    
    UIView *sub =[UIView new];
    [sub setBackgroundColor:[UIColor lightGrayColor]];
    sub.bounds = CGRectMake(0, 0, 100, 100);
    sub.center = self.view.center;
    [self.view addSubview:sub];
    
    [SearchBarViewController addShadowToView:sub withOpacity:0.5 shadowRadius:5 andCornerRadius:5];

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


/*
 周边加阴影，并且同时圆角
 */
+ (void)addShadowToView:(UIView *)view
            withOpacity:(float)shadowOpacity
           shadowRadius:(CGFloat)shadowRadius
        andCornerRadius:(CGFloat)cornerRadius
{
    //////// shadow /////////
    CALayer *shadowLayer = [CALayer layer];
    shadowLayer.frame = view.layer.frame;
    
    shadowLayer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
    shadowLayer.shadowOffset = CGSizeMake(0, 0);//shadowOffset阴影偏移，默认(0, -3),这个跟shadowRadius配合使用
    shadowLayer.shadowOpacity = shadowOpacity;//0.8;//阴影透明度，默认0
    shadowLayer.shadowRadius = shadowRadius;//8;//阴影半径，默认3
    
    //路径阴影
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    float width = shadowLayer.bounds.size.width;
    float height = shadowLayer.bounds.size.height;
    float x = shadowLayer.bounds.origin.x;
    float y = shadowLayer.bounds.origin.y;
    
    CGPoint topLeft      = shadowLayer.bounds.origin;
    CGPoint topRight     = CGPointMake(x + width, y);
    CGPoint bottomRight  = CGPointMake(x + width, y + height);
    CGPoint bottomLeft   = CGPointMake(x, y + height);
    
    CGFloat offset = 5.f;
    [path moveToPoint:CGPointMake(topLeft.x - offset, topLeft.y + cornerRadius)];
    [path addArcWithCenter:CGPointMake(topLeft.x + cornerRadius, topLeft.y + cornerRadius) radius:(cornerRadius + offset) startAngle:M_PI endAngle:M_PI_2 * 3 clockwise:YES];
    [path addLineToPoint:CGPointMake(topRight.x - cornerRadius, topRight.y - offset)];
    [path addArcWithCenter:CGPointMake(topRight.x - cornerRadius, topRight.y + cornerRadius) radius:(cornerRadius + offset) startAngle:M_PI_2 * 3 endAngle:M_PI * 2 clockwise:YES];
    [path addLineToPoint:CGPointMake(bottomRight.x + offset, bottomRight.y - cornerRadius)];
    [path addArcWithCenter:CGPointMake(bottomRight.x - cornerRadius, bottomRight.y - cornerRadius) radius:(cornerRadius + offset) startAngle:0 endAngle:M_PI_2 clockwise:YES];
    [path addLineToPoint:CGPointMake(bottomLeft.x + cornerRadius, bottomLeft.y + offset)];
    [path addArcWithCenter:CGPointMake(bottomLeft.x + cornerRadius, bottomLeft.y - cornerRadius) radius:(cornerRadius + offset) startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
    [path addLineToPoint:CGPointMake(topLeft.x - offset, topLeft.y + cornerRadius)];
    
    //设置阴影路径
    shadowLayer.shadowPath = path.CGPath;
    
    //////// cornerRadius /////////
    view.layer.cornerRadius = cornerRadius;
    view.layer.masksToBounds = YES;
    view.layer.shouldRasterize = YES;
    view.layer.rasterizationScale = [UIScreen mainScreen].scale;
    
    [view.superview.layer insertSublayer:shadowLayer below:view.layer];
}


@end
