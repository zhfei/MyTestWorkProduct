//
//  CirculateViewController.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/8/4.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "CirculateViewController.h"
#import "CirculateModel.h"

@interface CirculateViewController ()
@property (strong, nonatomic)NSMutableArray<CirculateModel *> *dateSource;

- (IBAction)circulateAction:(id)sender;

@end

@implementation CirculateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dateSource = @[].mutableCopy;
    
    for (int i = 0; i<20; i++) {
        [self.dateSource addObject:[CirculateModel circulateModel]];
    }
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

- (IBAction)circulateAction:(id)sender {
    [self circulate_1];
}

- (void)forAction {
//    NSInteger count = self.dateSource.count;
    for (int i = 0; i<self.dateSource.count; i++) {
        CirculateModel *model = self.dateSource[i];
        model.age = @(20);
        if (i == 10) {
            [self.dateSource removeLastObject];
        }
    }
}

- (void)forinAction {
    [self.dateSource makeObjectsPerformSelector:@selector(setAge:) withObject:@(0)];
    for (CirculateModel *model in self.dateSource) {
        model.age = @(10);
        
        CGFloat totalValue = [[self.dateSource valueForKeyPath:@"@sum.age"] floatValue];
        if (totalValue == 100) {
             [self.dateSource removeLastObject];
        }
    }
}

- (void)circulate_1 {
    [self.dateSource makeObjectsPerformSelector:@selector(setAge:) withObject:@(0)];
    [self.dateSource enumerateObjectsUsingBlock:^(CirculateModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.age = @(10);
        [self.dateSource removeLastObject];
    }];
}

- (void)circulate_2 {
    [self.dateSource makeObjectsPerformSelector:@selector(setAge:) withObject:@(0)];
    dispatch_apply(self.dateSource.count, dispatch_get_global_queue(0, 0), ^(size_t index) {
        NSLog(@"%@",[NSThread currentThread]);
        if (index == 10) {
            [self.dateSource removeObjectAtIndex:index];
        }
    });
}

- (void)circulate_3 {
    [self.dateSource makeObjectsPerformSelector:@selector(setAge:) withObject:@(0)];
    
    NSEnumerator *enumerator = [self.dateSource objectEnumerator];
    id obj = nil;
    while (obj = [enumerator nextObject]) {
        NSLog(@"%@",obj);
        [self.dateSource removeLastObject];
    }
}

@end
