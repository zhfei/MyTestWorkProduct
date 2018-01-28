//
//  DecouplingVC.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/5/25.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "DecouplingVC.h"

@interface DecouplingVC ()

@end

@implementation DecouplingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //分解控制器的基本思路是:定义新的对象来单独处理控制器里面的业务逻辑。
    
    /*
     1.数据源分离：创建一个数据源管理对象；1.处理传入的原始数据。2.当数据更新后，通知控制器刷新tableView。
     2.添加子控制器属性，将不同类别的任务分给相应的子控制器处理。
     3.添加模型数据处理类，处在model与VC中间。用于处理模型原始数据，直接提供给VC使用（也可以将中间类的任务分给model）
     4.数据绑定，利用KVC、KVO。数据更新，通知View更新。（感觉用处不大）
     5.delegate分离：创建一个类用来处理delegate需要处理的任务。
     */
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

@end
