//
//  GCDTestViewController.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2016/12/15.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "GCDTestViewController.h"

@interface GCDTestViewController ()

@end

@implementation GCDTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    

    [self shallowCopy];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

//    [self gcdTest];
    [self gcd_applyTest];
}

- (void)shallowCopy{

    NSMutableSet *arrayM=[NSMutableSet setWithObjects:@"hello",@"word", nil];
    
    id objM=[arrayM mutableCopy];
    id obj=[arrayM copy];
    
    NSLog(@"objM：%@-----obj:%@",[objM class],[obj class]);
    
    NSSet *array=[NSSet setWithObjects:@"hello",@"word", nil];
    
    
    id objM1=[array mutableCopy];
    id obj1=[array copy];
    
    NSLog(@"objM：%@-----obj:%@",[objM1 class],[obj1 class]);
}

-(void)gcdTest
{

    dispatch_queue_t serialQueue= dispatch_queue_create("串行队列", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t concurrentQueue=dispatch_queue_create("并行队列", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_queue_t mainQueue=dispatch_get_main_queue();
    dispatch_queue_t globalQueue=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    //1：
//    for(int i=0;i<10;i++){
//        dispatch_sync(serialQueue, ^{
//            NSLog(@"任务执行中....-%d\n mainThread:%@",i,[NSThread currentThread]);
//        });
//    }
    //结果，同步任务在串行队列中，在主线程下串行执行
    
    //2：
//    for(int i=0;i<10;i++){
//        dispatch_sync(concurrentQueue, ^{
//            NSLog(@"任务执行中....-%d\n mainThread:%@",i,[NSThread currentThread]);
//        });
//    }
    //结果，同步任务在并行队列中，在主线程下串行执行
    
    //3：
//    for(int i=0;i<10;i++){
//        dispatch_sync(mainQueue, ^{
//            NSLog(@"任务执行中....-%d\n mainThread:%@",i,[NSThread currentThread]);
//        });
//    }
    //结果，同步任务在主队列中，锁死
    
    //4：
//    for(int i=0;i<10;i++){
//        dispatch_sync(globalQueue, ^{
//            NSLog(@"任务执行中....-%d\n mainThread:%@",i,[NSThread currentThread]);
//        });
//    }
    //结果，同步任务在全局队列中，在主线程下串行执行
    
    //5：
//    for(int i=0;i<10;i++){
//        dispatch_async(serialQueue, ^{
//            NSLog(@"任务执行中....-%d\n mainThread:%@",i,[NSThread currentThread]);
//        });
//    }
    //结果，异步任务在串行队列中，在一个子线程中串行执行
    
    //6：
//    for(int i=0;i<10;i++){
//        dispatch_async(concurrentQueue, ^{
//            NSLog(@"任务执行中....-%d\n mainThread:%@",i,[NSThread currentThread]);
//        });
//    }
    //结果，异步任务在并行队列中，在多个子线程中并行执行
    
    //7：
//    for(int i=0;i<10;i++){
//        dispatch_async(mainQueue, ^{
//            NSLog(@"任务执行中....-%d\n mainThread:%@",i,[NSThread currentThread]);
//        });
//    }
    //结果，异步任务在主队列中，在主线程中串行执行
    
    //8：
    for(int i=0;i<10;i++){
        dispatch_async(globalQueue, ^{
            NSLog(@"任务执行中....-%d\n mainThread:%@",i,[NSThread currentThread]);
        });
    }
    //结果，异步任务在全局队列中，在多个子线程中并行执行
}

- (void)gcd_applyTest{

    NSArray *array=@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",];
    NSInteger count =array.count;
    
//    //一、for循环
//    for (NSInteger i=0; i<count; i++) {
//        NSLog(@"%@----%@",array[i],[NSThread currentThread]);
//    }
    
//    //二、forin 快速枚举
//    for (NSString *string in array) {
//        NSLog(@"%@----%@",string,[NSThread currentThread]);
//    }
//
//    //三、NSEnumerator
//    NSEnumerator *enumer=[array objectEnumerator];
//    id obj;
//    while (obj=[enumer nextObject]) {
//        NSLog(@"%@----%@",obj,[NSThread currentThread]);
//    }
//
//    //四、快速遍历
//    //顺序遍历
//    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        NSLog(@"%@----%@",array[idx],[NSThread currentThread]);
//    }];
//    //倒序遍历
//    [array enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        NSLog(@"%@----%@",array[idx],[NSThread currentThread]);
//    }];
//
    //五、快速迭代
    //将block中的任务，逐个放到queue中，然后进行dispatch_sync执行
    //多线程同步循环
    
    dispatch_queue_t queue =dispatch_queue_create("apply并行队列", DISPATCH_QUEUE_CONCURRENT);
    dispatch_apply(count, queue, ^(size_t index) {
        NSLog(@"%@----%@",array[index],[NSThread currentThread]);
    });
//
//    
    
    NSLog(@"end");
    
}

@end
