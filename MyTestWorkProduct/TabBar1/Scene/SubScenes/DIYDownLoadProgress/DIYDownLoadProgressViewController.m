//
//  DIYDownLoadProgressViewController.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/3/24.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "DIYDownLoadProgressViewController.h"
#import "XDownLoadOriginalManager.h"

@interface DIYDownLoadProgressViewController ()

@end

@implementation DIYDownLoadProgressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UISwitch *sw =[[UISwitch alloc]init];
    sw.center=self.view.center;
    [self.view addSubview:sw];
    [sw addTarget:self action:@selector(downLoadData:) forControlEvents:UIControlEventValueChanged];
    
    
}

- (void)downLoadData:(UISwitch *)sw
{
    if (sw.on) {
        NSString *path= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
        
        [[XDownLoadOriginalManager sharedInstance] configureDownloadWithUrlString:@"http://7xqkjm.com1.z0.glb.clouddn.com/Cornerstone_v2.7.10.dmg" fileDestPath:[path stringByAppendingString:@"/Product.zip"]];
        [[XDownLoadOriginalManager sharedInstance] downLoad];
        [XDownLoadOriginalManager sharedInstance].successBlock=^{
            
            //        [[XZipProductsFileManager sharedInstance] handleZipFileToOppositeTablesWithZipFilePath:[XDownLoadOriginalManager sharedInstance].destPath];
        };
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

@end
