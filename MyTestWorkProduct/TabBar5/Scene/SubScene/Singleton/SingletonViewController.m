//
//  SingletonViewController.m
//  MyTestWorkProduct
//
//  Created by xuyefeng on 17/2/19.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "SingletonViewController.h"
#import "SingletonTemplate.h"
#import "CodingSubClass.h"


@interface SingletonViewController ()
@property (nonatomic, assign)CGFloat count;
@end

@implementation SingletonViewController
    
+ (void)load {

    NSLog(@"SingletonViewController--%@--date:%@",NSStringFromSelector(_cmd),[NSDate date]);
}
    
+ (void)initialize {

     NSLog(@"SingletonViewController--%@--date:%@",NSStringFromSelector(_cmd),[NSDate date]);
}

- (void)dealloc {

     NSLog(@"SingletonViewController--%@--date:%@",NSStringFromSelector(_cmd),[NSDate date]);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    SingletonTemplate *staa =[[SingletonTemplate alloc] init];
//    
//    NSLog(@"staa:%@",staa);
    
    [SingletonTemplate sharedSingletonTemplate];
    
    sleep(2);
    
    [SingletonTemplate destroyInstance];
    
    
//    CodingSubClass *csc=[CodingSubClass codingSubClass];
//    
//    CodingSubClass *csc1=[CodingSubClass codingSubClass];
//    CodingSubClass *csc2=[CodingSubClass codingSubClass];
//    
//    csc.demands=@[csc1,csc2];
//    
//    NSData *data= [NSKeyedArchiver archivedDataWithRootObject:csc];
//    
//    id obj= [NSKeyedUnarchiver unarchiveObjectWithData:data];
//    
//   
//    NSLog(@"%@:----%@",NSStringFromSelector(_cmd),obj);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSInteger count1,count2;
    count1 = 10;
    count2 = 20;

    [self subMethod];
    NSLog(@"touches:%@",touches);
    
    self.count = 30;
}

- (BOOL)subMethod {

    MyLog(@"%@",NSStringFromSelector(_cmd));
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
