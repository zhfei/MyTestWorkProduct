//
//  SocketServer.m
//  MyTestWorkProduct
//
//  Created by 周飞 on 2018/7/1.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

#import "SocketServer.h"
#import <CocoaAsyncSocket/GCDAsyncSocket.h>

@interface SocketServer ()
{
    GCDAsyncSocket *_socket;
    NSString *_socketHost;
    uint16_t _socketPort;
    NSMutableData *_bufferData;
}

@end

@implementation SocketServer
+ (instancetype)sharedSocketServer {
    static dispatch_once_t onceToken;
    static SocketServer *server;
    dispatch_once(&onceToken, ^{
        server = [[SocketServer alloc] init];
    });
    return server;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [self sharedSocketServer];
}

- (void)listening:(id)sender {
    //[self disconnect]; 如果使用这行代码，那么导致下面监听失败，因为serverSocket为nil
    [_socket disconnect];
    NSError *error = nil;
    BOOL result = [_socket acceptOnPort:_socketPort error:&error];
    if(result && !error) {
        NSLog(@"%d端口正在监听\n",_socketPort);
    }else {
        NSLog(@"%d端口监听失败，错误为:%@\n",_socketPort,error);

    }
}

#pragma mark - socket代理
- (void)socket:(GCDAsyncSocket *)sock didAcceptNewSocket:(GCDAsyncSocket *)newSocket {
    [_socket disconnect];
    _socket = newSocket; //使用这个newSocket和client通信，客户端方自己也有一个socket与服务器通信，这俩你个socket的建立通信通道是同一个的
//    self.display.text = [self.display.text stringByAppendingString:@"成功和一个客户端建立连接\n"];
    
}


@end
