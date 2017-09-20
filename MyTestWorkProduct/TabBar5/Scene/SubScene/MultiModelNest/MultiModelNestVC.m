//
//  MultiModelNestVC.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/9/13.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "MultiModelNestVC.h"
#import "Models.h"

@interface MultiModelNestVC ()
@property (strong, nonatomic)ModelC *modelC;
@end

@implementation MultiModelNestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setupData];
    
}

- (void)setupData {

    ModelA * modelA = [ModelA new];
    modelA.username = @"xiaoming";
    modelA.password = @"123456";
    
    ModelB *modelB = [ModelB new];
    modelB.modelA = modelA;
    modelB.age = 22;
    
    ModelB *modelB1 = [ModelB new];
    modelB1.modelA = modelA;
    modelB1.age = 23;
    
    ModelB *modelB2 = [ModelB new];
    modelB2.modelA = modelA;
    modelB2.age = 24;
    
    ModelB *modelB3 = [ModelB new];
    modelB3.modelA = modelA;
    modelB3.age = 25;
    
    ModelC *modelC = [ModelC new];
    modelC.modelBArray = @[modelB,modelB1,modelB2,modelB3];
    modelC.man = YES;
    
    self.modelC = modelC;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    NSDictionary *dict1 = [self.modelC produceNestDictionary];
    NSLog(@"%@",dict1);
    
    ModelC *modelC = [[ModelC alloc] initWithNestDictionary:dict1];
    NSLog(@"%@",modelC);
}

@end
