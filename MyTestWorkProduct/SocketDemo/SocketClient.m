//
//  SocketClient.m
//  MyTestWorkProduct
//
//  Created by 周飞 on 2018/7/1.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

#import "SocketClient.h"
#import "SocketMacro.h"
#import <CocoaAsyncSocket/GCDAsyncSocket.h>


@interface SocketClient ()
{
    GCDAsyncSocket *_socket;
    NSString *_socketHost;
    uint16_t _socketPort;
    NSMutableData *_bufferData;
}
@property (nonatomic, retain) NSTimer   *heartTimer;   // 心跳计时器

@end

@implementation SocketClient
SingletonM(SocketClient)


- (NSTimer *)heartTimer {
    if (!_heartTimer) {
        _heartTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
            [self longConnectToSocket];
        }];
    }
    return _heartTimer;
}

// 心跳连接
-(void)longConnectToSocket{
    //根据服务器要求发送固定格式的数据，假设为指令@"longConnect"，但是一般不会是这么简单的指令
    NSString *longConnect = @"longConnect";
    NSData   *dataStream  = [longConnect dataUsingEncoding:NSUTF8StringEncoding];
    [_socket writeData:dataStream withTimeout:1 tag:1];
}


#define TIME_OUT 20
// 建立socket连接
-(void)socketConnectHost{
    _socket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)];
    NSLog(@"连接服务器");
    NSError *error = nil;
    [_socket connectToHost:_socketHost onPort:_socketPort withTimeout:TIME_OUT error:&error];
}

// socket成功连接回调
-(void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port {
    NSLog(@"成功连接到%@:%d",host,port);
    _bufferData = [[NSMutableData alloc] init]; // 存储接收数据的缓存区
    [_socket readDataWithTimeout:-1 tag:99];
}

#pragma mark - 断开链接
- (void)cutOffSocket {
    [_socket disconnect];
    _socket.userData =  @(SocketOfflineByUser);
    NSLog(@"断开连接");
}

-(void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err {
    if (err.code == 57) {
        _socket.userData = @(SocketOfflineByWifiCut); // wifi断开
    }
    else {
        _socket.userData =  @(SocketOfflineByServer);  // 服务器掉线
    }
    NSLog(@"断开连接，错误：%@",err);
}

#pragma mark - 发送消息
// 发消息
- (void)sendMessage:(NSData *)data {
    [_socket writeData:data withTimeout:TIME_OUT tag:10];
}

// wirte成功
-(void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag
{
    // 持续接收数据
    // 超时设置为附属，表示不会使用超时
    [_socket readDataWithTimeout:-1 tag:tag];
}

-(void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag {
    // 在这里处理消息
//    [self disposeBufferData:data];
    
    //持续接收服务端的数据
    [sock readDataWithTimeout:-1 tag:tag];
}


@end
