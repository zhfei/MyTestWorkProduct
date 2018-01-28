//
//  TabBar4ViewController.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 15/11/3.
//  Copyright © 2015年 zhoufei. All rights reserved.
//

#import "TabBar4ViewController.h"
#import "UIButton+RACCommandSupport.h"
#import "UIControl+RACSignalSupport.h"
#import "RACCommand.h"
#import "RACSignal.h"
#import <WebKit/WebKit.h>
#import <JavaScriptCore/JavaScriptCore.h>
#import "UserLoginInfo.h"
#import "Masonry.h"

#import "XDownLoadOriginalManager.h"
#import "XZipProductsFileManager.h"

@interface TabBar4ViewController ()
{
    dispatch_queue_t queue;
}
@property (weak, nonatomic) IBOutlet UIButton *myBtn;
@property (strong,nonatomic) UIImageView *bgView;
@property (weak, nonatomic) IBOutlet UIButton *reStartBtn; 

@end

@implementation TabBar4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.tabBarItem.title=@"待使用";
 
    
    //[MyNavigationtroller createRightBtnTitle:@"注册" target:self action:@selector(<#selector#>)];
    
    queue =dispatch_queue_create("myQueue", DISPATCH_QUEUE_CONCURRENT);
    
    UIImageView *bgView =[[UIImageView alloc]init];
    self.bgView=bgView;
    [self.view insertSubview:bgView atIndex:0];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    bgView.contentMode=UIViewContentModeScaleAspectFit;
    
    self.myBtn.rac_command=[[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        

        [self downLoadData];
        return [RACSignal empty];
    }];
    
    self.reStartBtn.rac_command=[[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        self.reStartBtn.selected=!self.reStartBtn.selected;
//        
//        if (self.reStartBtn.selected) {
//            [[XDownLoadManager sharedInstance] pause];
//        }else{
//            [[XDownLoadManager sharedInstance] start];
//        }
        
        
        return [RACSignal empty];
    }];

    
}

- (void)downLoadData
{
    
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

- (void)doneRightNow:(int)count
{
    
//    dispatch_async(queue, ^{
//        sleep(1.0);
//        MyLog(@"blockString:%d",count);
//    });
//    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        sleep(1.0);
        MyLog(@"blockString:%d---%@",count,[NSThread currentThread]);
    });
}


/**
 ** lineView:	   需要绘制成虚线的view
 ** lineLength:	 虚线的宽度
 ** lineSpacing:	虚线的间距
 ** lineColor:	  虚线的颜色
 **/
- (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(lineView.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}


@end
