//
//  BluetoothViewController.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/7/12.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import <GameKit/GameKit.h>

#import "BluetoothViewController.h"
#import "UILabel+YYAdditions.h"
#import "Masonry.h"

@interface BluetoothViewController() <GKPeerPickerControllerDelegate,UIImagePickerControllerDelegate,UINavigationBarDelegate>
@property (strong, nonatomic) UIImageView *imageView;//照片显示视图
@property (strong,nonatomic) GKSession *session;//蓝牙连接会话
@end

@implementation BluetoothViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"发送" style:UIBarButtonItemStylePlain target:self action:@selector(sendClick:)];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"选择" style:UIBarButtonItemStylePlain target:self action:@selector(selectClick:)];

    //蓝牙使用，第一种方法
    [self BluetoothAction1];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [self.view addSubview:[UILabel label]];
}

- (void)BluetoothAction1
{
    self.imageView=[[UIImageView alloc]init];
    [self.view addSubview:self.imageView];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
    GKPeerPickerController *pearPickerController=[[GKPeerPickerController alloc]init];
    pearPickerController.delegate=self;
    
    [pearPickerController show];
}

#pragma mark - 选择图片
- (IBAction)selectClick:(UIBarButtonItem *)sender {
    UIImagePickerController *imagePickerController=[[UIImagePickerController alloc]init];
    imagePickerController.delegate=self;
    
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

//发送图片
- (IBAction)sendClick:(UIBarButtonItem *)sender {
    NSData *data=UIImagePNGRepresentation(self.imageView.image);
    NSError *error=nil;
    [self.session sendDataToAllPeers:data withDataMode:GKSendDataReliable error:&error];
    if (error) {
        NSLog(@"发送图片过程中发生错误，错误信息:%@",error.localizedDescription);
    }
}

#pragma mark - GKPeerPickerController代理方法（蓝牙相关）
/**
 *  连接到某个设备
 *
 *  @param picker  蓝牙点对点连接控制器
 *  @param peerID  连接设备蓝牙传输ID
 *  @param session 连接会话
 */
-(void)peerPickerController:(GKPeerPickerController *)picker didConnectPeer:(NSString *)peerID toSession:(GKSession *)session{
    self.session=session;
    NSLog(@"已连接客户端设备:%@.",peerID);
    //设置数据接收处理句柄，相当于代理，一旦数据接收完成调用它的-receiveData:fromPeer:inSession:context:方法处理数据
    [self.session setDataReceiveHandler:self withContext:nil];
    
    [picker dismiss];//一旦连接成功关闭窗口
}

#pragma mark - 蓝牙数据接收方法
- (void) receiveData:(NSData *)data fromPeer:(NSString *)peer inSession: (GKSession *)session context:(void *)context{
    UIImage *image=[UIImage imageWithData:data];
    self.imageView.image=image;
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    NSLog(@"数据发送成功！");
}


#pragma mark - UIImagePickerController代理方法（图片选择相关方法）
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    self.imageView.image=[info objectForKey:UIImagePickerControllerOriginalImage];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
