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




@end
