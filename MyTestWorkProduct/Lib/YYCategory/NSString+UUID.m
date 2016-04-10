//
//  NSString+UUID.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/1/20.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "NSString+UUID.h"
#import "SSKeychain.h"

@implementation NSString (UUID)

//uuid读取顺序：先读本地后读钥匙串，优先使用本地udid

+ (NSString *)stringWithStaticUUID{
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"UUIDString.plist"];
    
    if ([NSString touchFile:path]) {
    
        NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
        
        //本地udid数据为空，说明app第一次运行
        if (dict==nil||dict[@"XUUID"]==nil) {
            dict=[NSMutableDictionary dictionary];
            
            NSString *uuid = [SSKeychain passwordForService:@"XUUID" account:@"XUUID"];
            
            //＊＊考虑到，如果钥匙串中有数据，但是没有取到，这种情况无法处理。。。
            if (uuid==nil) {
                //1.第一次安装app
                //新生成一个UUID
                CFUUIDRef uuidObj = CFUUIDCreate(nil);//create a new UUID
                NSString *uuidString = (__bridge_transfer NSString *)CFUUIDCreateString(nil, uuidObj);
                CFRelease(uuidObj);
               
                //钥匙串保存
                [SSKeychain setPassword:uuidString forService:@"XUUID" account:@"XUUID"];
                //本地保持
                [dict setValue:uuidString forKey:@"XUUID"];
                [dict writeToFile:path atomically:YES];
                
                return uuidString;
                
            }else{
                //2.卸载app后，再次安装 或者 在Documents下，将UUIDString.plist文件恶意删除后，再次运行app
                NSString *uuid = [SSKeychain passwordForService:@"XUUID" account:@"XUUID"];
                
                //本地保持
                [dict setValue:uuid forKey:@"XUUID"];
                [dict writeToFile:path atomically:YES];
                
                return uuid;
            }
            
        }else{
        //本地UUIDValue有值，app非第一次运行
            
            NSString *uuid = [SSKeychain passwordForService:@"XUUID" account:@"XUUID"];
            if (uuid==nil) {
                //访问钥匙串失败
                
                //＊＊考虑到用户第一次安装app时，新生成一个udid，此udid要保存到钥匙串和本地。
                //1.当数据保存时：本地保存成功，钥匙串保存失败时，会满足此条件     ，需要修改钥匙串，修正udid
                //由于情况1,出现概率极小，不做处理
                
               
                
            }else{
                //访问钥匙串成功
                
                //此处多做一次校验，如果钥匙串中的udid和本地存储的udid不一致，则以钥匙串中的udid为准并且更新本地的udid
                if (![uuid isEqualToString:dict[@"XUUID"]]) {
                    //本地保持
                    [dict setValue:uuid forKey:@"XUUID"];
                    [dict writeToFile:path atomically:YES];
                    
                    return uuid;
                }
            }
            
            return dict[@"XUUID"];

        }
        

        
    }else{
        
      //创建本地plist文件失败
        return [SSKeychain passwordForService:@"XUUID" account:@"XUUID"];
        
    }
    
    return [SSKeychain passwordForService:@"XUUID" account:@"XUUID"];

}


+ (BOOL)touchFile:(NSString *)file
{
    if ( NO == [[NSFileManager defaultManager] fileExistsAtPath:file] )
    {
        return [[NSFileManager defaultManager] createFileAtPath:file
                                                       contents:[NSData data]
                                                     attributes:nil];
    }
    return YES;
}

@end
