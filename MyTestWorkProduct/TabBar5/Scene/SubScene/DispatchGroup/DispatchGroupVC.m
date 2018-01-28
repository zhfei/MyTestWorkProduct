//
//  DispatchGroupVC.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/4/22.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "DispatchGroupVC.h"

@interface DispatchGroupVC ()

@end

@implementation DispatchGroupVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"DispatchGroup";
    
    [self dispatchGroupMethod1];
    [self dispatchGroupMethod2];
}

/*!*****/
-(void)dispatchGroupMethod1 {

    dispatch_queue_t queue1 = dispatch_queue_create("dispatchGroupMethod1.queue1", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t group1 = dispatch_group_create();
    
    dispatch_group_async(group1, queue1, ^{
        dispatch_async(queue1, ^{
            for (NSInteger i =0; i<3; i++) {
                sleep(1);
                NSLog(@"%@-异步任务执行-:%ld",@"任务1",(long)i);

            }
        });
    });
    
    
    dispatch_group_async(group1, queue1, ^{
        dispatch_async(queue1, ^{
            for (NSInteger i =0; i<3; i++) {
                sleep(1);
                NSLog(@"%@-异步任务执行-:%ld",@"任务2",(long)i);
                
            }
        });
    });
    
//    //等待上面的任务全部完成后，会往下继续执行 （会阻塞当前线程）
//    dispatch_group_wait(group1, DISPATCH_TIME_FOREVER);
    
    //等待上面的任务全部完成后，会收到通知执行block中的代码 （不会阻塞线程）
    dispatch_group_notify(group1, queue1, ^{
        NSLog(@"Method1-全部任务执行完成");
    });
}

/*!*****/
-(void)dispatchGroupMethod2 {
    
    dispatch_queue_t queue2 = dispatch_queue_create("dispatchGroupMethod2.queue2", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t group2 = dispatch_group_create();
    

    dispatch_group_enter(group2);
    dispatch_async(queue2, ^{
        for (NSInteger i =0; i<3; i++) {
            sleep(1);
            NSLog(@"%@-异步任务执行-:%ld",@"任务1",(long)i);
            
        }
        dispatch_group_leave(group2);
    });
    

    
    dispatch_group_enter(group2);
    dispatch_async(queue2, ^{
        for (NSInteger i =0; i<3; i++) {
            sleep(1);
            NSLog(@"%@-异步任务执行-:%ld",@"任务2",(long)i);
            
        }
        dispatch_group_leave(group2);
    });
    
//    //等待上面的任务全部完成后，会往下继续执行 （会阻塞当前线程）
//    dispatch_group_wait(group2, DISPATCH_TIME_FOREVER);
    
    //等待上面的任务全部完成后，会收到通知执行block中的代码 （不会阻塞线程）
    dispatch_group_notify(group2, queue2, ^{
        NSLog(@"Method2-全部任务执行完成");
    });
}

#pragma mark --任务

/*!**异步任务***/
- (void)asyncExecuteTaskWithQueue:(dispatch_queue_t) queue title:(NSString *)title completeBlock:(void(^)())completeBlock {

    NSInteger i =0;
    for (; i<3; i++) {
        dispatch_async(queue, ^{
            sleep(1);
            NSLog(@"%@-异步任务执行-:%ld",title,(long)i);
        });
    }
    if (completeBlock) {
        completeBlock();
    }
}

/*!**同步任务***/
- (void)syncExecuteTaskWithQueue:(dispatch_queue_t) queue title:(NSString *)title completeBlock:(void(^)())completeBlock {
    
    NSInteger i =0;
    for (; i<3; i++) {
        dispatch_sync(queue, ^{
            sleep(1);
            NSLog(@"%@-同步任务执行-:%ld",title,(long)i);
        });
    }
    if (completeBlock) {
        completeBlock();
    }
}


@end
