//
//  LocalFileReadingAndWritingVC.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/2/10.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "LocalFileReadingAndWritingVC.h"
#import "XFileManager.h"
#import "MyRealm.h"
#import "RealmPerson.h"

@interface LocalFileReadingAndWritingVC ()
- (IBAction)ReadingBtnAction:(UIButton *)sender;
- (IBAction)WritingBtnAction:(UIButton *)sender;

@end

@implementation LocalFileReadingAndWritingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    NSString *deskTopPath=@"/Users/zhoufei/Desktop/realm/cashier.realm";
//    
//    NSString *path= [NSString stringWithFormat:@"%@/Documents/testFile/realmData.realm",NSHomeDirectory()];
//    
//    NSError *error;
//    [[NSFileManager defaultManager] moveItemAtPath:deskTopPath toPath:path error:&error];
//    if (error) {
//         NSLog(@"error:%@",error.description);
//    }
    
//    RealmPerson *rp =[[RealmPerson alloc]init];
//    rp.name=@"小明";
//    rp.address=@"北京人";
//    rp.age=18;
//    RLMArray *array = [[RLMArray alloc] initWithObjectClassName:[Dog className]];
//    for (int i = 0; i< 100; i++) {
//        Dog *dog = [Dog new];
//        dog.name = @"旺财";
//        dog.age = 1;
//        [array addObject:dog];
//    }
//    rp.dogs = array;
//    
//    [[MyRealm defaultCashier] transactionWithBlock:^{
//        [[MyRealm defaultCashier] addObject:rp];
//    }];
//    
//    
//    
//    RLMResults *results= [RealmPerson allObjects];
//    
//    NSLog(@"path:%@--%@",NSHomeDirectory(),results);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [self updateRealmObj];
}

- (IBAction)ReadingBtnAction:(UIButton *)sender {
    
    id obj= [self readingDataFromLocalDataFile];
    
//    NSLog(@"%@",obj);
    
    [self writingDataToLocalDataFile:obj];
}

- (IBAction)WritingBtnAction:(UIButton *)sender {
    
    NSData *data=[NSJSONSerialization dataWithJSONObject:@{@"name":@"kite",@"age":@"12"} options:NSJSONWritingPrettyPrinted error:nil];
    
    [self writingDataToLocalDataFile:data];
}

/*!
 *  @author zhoufei
 *
 *  @brief 从本地数据流文件中读取数据
 *  @return 读取到的数据
 */
- (id)readingDataFromLocalDataFile{
    
    
    
    NSString *path= [XFileManager getFilePathForDocuments:@"testFile/realmData.realm"];
    
    NSData *data=  [NSData dataWithContentsOfFile:path];
    
   
    
    return data;
}

/*!
 *  @author zhoufei
 *
 *  @brief 将数据流写到本地的数据流文件中
 *  @param data 要写入的数据流数据
 */
- (void )writingDataToLocalDataFile:(NSData*)data{
    
    [XFileManager createDirectoryInDocuments:^(NSString *dirPath, NSError *error) {
        
        NSString *filePath=[dirPath stringByAppendingString:@"/testData2.realm"];

        if ([[NSFileManager defaultManager] createFileAtPath:filePath contents:data attributes:nil]) {
            NSLog(@"保存成功！！%@",filePath);
        }else{
            NSLog(@"保存失败！！%@",filePath);
        }
        
    } path:@"testFile"];
    

    
}

#pragma mark - realm并发

- (void)updateRealmObj {

    dispatch_queue_t queue= dispatch_get_global_queue(0, 0);
    dispatch_group_t group =dispatch_group_create();
    
    dispatch_group_async(group, queue, ^{
        
        RealmPerson *rp =[[RealmPerson alloc]init];
        rp.name=@"小花";
        rp.address=@"苗族人";
        rp.age=18;
        RLMArray *array = [[RLMArray alloc] initWithObjectClassName:[Dog className]];
        for (int i = 0; i< 100; i++) {
            Dog *dog = [Dog new];
            dog.name = @"强强";
            dog.age = 1;
            [rp.dogs addObject:dog];
        }

        [[MyRealm defaultCashier] transactionWithBlock:^{
            [[MyRealm defaultCashier] addObject:rp];
        }];
        
    });
    
    dispatch_group_notify(group, queue, ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            RealmPerson * per = [[RealmPerson allObjectsInRealm:[MyRealm defaultCashier]] lastObject];
            NSLog(@"opention1开始-----:%@",[NSThread currentThread]);
            [[MyRealm defaultCashier] transactionWithBlock:^{
                per.name = @"麦穗";
                
//                for (int i = 0; i<10; i++) {
//                    Dog *dog = per.dogs[i];
//                    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//                        [[MyRealm defaultCashier] transactionWithBlock:^{
//                            dog.name = @"皮皮";
//                            NSLog(@"名字更新-----:%@",[NSThread currentThread]);
//                        }];
//                    });
//                }
            }];
        });
    });


}


@end
