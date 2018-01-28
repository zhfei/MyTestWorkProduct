//
//  UserLoginInfo.m
//  Product
//
//  Created by zhoufei on 16/2/2.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "UserLoginInfo.h"
#import "SSKeychain.h"
#import "NSData+AES.h"

NSString *const RNADOMSTRING=@"@#$x54ke%^%shi89&&~@";

@interface UserLoginInfo()
{
    NSString *_plistPath;
}
@end

@implementation UserLoginInfo
+(instancetype)sharedInstance{
    
    static dispatch_once_t onceToken;
    static UserLoginInfo * __singleton__;
    dispatch_once(&onceToken, ^{
        __singleton__ =[[[self class]alloc]init];
    });
    return __singleton__;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _plistPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"XLoginInfo.plist"];
    }
    return self;
}

//uuid读取顺序：先读本地后读钥匙串，优先使用本地UUID，如果出现本地和钥匙串中udid不一致会以钥匙串中为准并更新本地UUID

#pragma mark UUID－读取－存储
//获取UUID
- (NSString *)stringWithStaticUUID{

    
    if ([self touchFile:_plistPath]) {
        
        NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:_plistPath];
        if (dict==nil) {
            dict=[NSMutableDictionary dictionary];
        }
        
        //本地udid数据为空，说明app第一次运行
        if (dict[KUUID]==nil) {
            
            NSString *uuid = [SSKeychain passwordForService:KUUID account:KUUID];
            
            //＊＊考虑到，如果钥匙串中有数据，但是没有取到，这种情况无法处理。。。
            if (uuid==nil) {
                //1.第一次安装app
                //新生成一个UUID
                CFUUIDRef uuidObj = CFUUIDCreate(nil);//create a new UUID
                NSString *uuidString = (__bridge_transfer NSString *)CFUUIDCreateString(nil, uuidObj);
                CFRelease(uuidObj);
                
                //钥匙串保存
                BOOL keySuccess= [SSKeychain setPassword:uuidString forService:KUUID account:KUUID];
                //为钥匙串存储添加一次补救措施，当第一次生成的XUUID保存失败时，会纪录下来，等下次访问uuid时，会重新更新系统钥匙串
                [dict setValue:keySuccess?@0:@1 forKey:@"keyChainFailureTimes"];
                
                //本地保持
                [dict setValue:[self aES256EncryptDataWithKey:KUUID contentString:uuidString] forKey:KUUID];
                [dict writeToFile:_plistPath atomically:YES];
                
                return uuidString;
                
            }else{
                //2.卸载app后，再次安装 或者 在Documents下，将plist文件恶意删除后，再次运行app
                
                //本地保持
                [dict setValue:[self aES256EncryptDataWithKey:KUUID contentString:uuid] forKey:KUUID];
                [dict writeToFile:_plistPath atomically:YES];
                
                return uuid;
            }
            
        }else{
            //本地UUID有值，app非第一次运行
            
            NSString *uuid = [SSKeychain passwordForService:KUUID account:KUUID];
            if (uuid==nil) {
                //访问钥匙串失败
                
                //＊＊考虑到用户第一次安装app时，新生成一个udid，此udid要保存到钥匙串和本地。
                //1.当数据保存时：本地保存成功，钥匙串保存失败时，会满足此条件     ，需要修改钥匙串，修正udid
                //由于情况1,出现概率极小，补救一次
                
                
                NSDictionary *secDict = [NSDictionary dictionaryWithContentsOfFile:_plistPath];
                NSNumber *num= secDict[@"keyChainFailureTimes"];
                if ([num integerValue]>0) {
                    //补救一次
                    [SSKeychain setPassword:[self aES256DecryptDataWithKey:KUUID contentData:secDict[KUUID]] forService:KUUID account:KUUID];
                    
                    [secDict setValue:@0 forKey:@"keyChainFailureTimes"];
                    [secDict writeToFile:_plistPath atomically:YES];
                }
                
                
            }else{
                //访问钥匙串成功
                
                //此处多做一次校验，如果钥匙串中的XUUID和本地存储的XUUID不一致，则以钥匙串中的XUUID为准并且更新本地的XUUID
                if (![uuid isEqualToString:[self aES256DecryptDataWithKey:KUUID contentData:dict[KUUID]]]) {
                    //本地保持
                    [dict setValue:[self aES256EncryptDataWithKey:KUUID contentString:uuid] forKey:KUUID];
                    [dict writeToFile:_plistPath atomically:YES];
                    
                    return uuid;
                }
            }
            
            return [self aES256DecryptDataWithKey:KUUID contentData:dict[KUUID]];
            
        }
        
        
        
    }else{
        
        XLog_ERROR(@"function:%s- %@ created faile",__FUNCTION__,_plistPath);
        
        //创建本地plist文件失败
        return [SSKeychain passwordForService:KUUID account:KUUID];
        
    }
    
    //上面所有的情况都不满足时，从钥匙串中取
    return [SSKeychain passwordForService:KUUID account:KUUID];
    
}

#pragma mark 设备绑定读取操作
//读取：获取判定当前设备是否被绑定的数据字典
- (BOOL)bindingWithDevice{

    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:_plistPath];
    
    //dict
    if (dict==nil) {
        dict=[NSMutableDictionary dictionary];
    }
    
    //如果钥匙串中已经保存了密码，则判定为已经绑定
    //当从钥匙串读取设备绑定标示量时，如果能读取到，就更新到本地，尽量保证本地数据和钥匙串中的一致，如果从钥匙串读取失败，则使用上次更新到本地的数据。
    NSString *deviceSecret = [SSKeychain passwordForService:XAPIKeyChainService account:DeviceSecretKey];
    if (deviceSecret && [deviceSecret isKindOfClass:[NSString class]] && deviceSecret.length > 0) {
        [dict setValue:deviceSecret forKey:KBindingKey];
        
        if ([self touchFile:_plistPath]) {
            [dict writeToFile:_plistPath atomically:YES];
        }else{
            XLog_ERROR(@"function:%s- %@ created faile",__FUNCTION__,_plistPath);
            
        }
        
    }
    
    //如果第一次访问或者本地数据被恶意删掉后再登录，同时从钥匙串中读取设备绑定标示量又出现失败时，将本地设备绑定标示量标示为“未绑定”
    if ([dict[KBindingKey] length]>0){
        return YES;
    }else if (dict[KBindingKey]==nil) {
        return NO;
    }

    return NO;
}

//存储：更新当前设备是否被绑定的状态
- (void)saveBindingInfoWith:(NSString*)string{
    if ([self touchFile:_plistPath]) {
        
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:_plistPath];
        if (dict==nil) {
            dict=[NSMutableDictionary dictionary];
        }
        
        [dict setValue:string forKey:KBindingKey];
        [dict writeToFile:_plistPath atomically:YES];
        
    }else{
        XLog_ERROR(@"function:%s- %@ created faile",__FUNCTION__,_plistPath);
        
    }
}

#pragma mark 用户名读取操作
//获取用户名
- (NSString *)userNameString
{
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:_plistPath];
    
    //dict
    if (dict==nil) {
        dict=[NSMutableDictionary dictionary];
    }
    
    //当从钥匙串读取用户名时，如果能读取到，就更新到本地，尽量保证本地数据和钥匙串中的一致，如果从钥匙串读取失败，则使用上次更新到本地的数据。
    NSString *userName = [[SSKeychain accountsForService:KPassWord] lastObject][kSSKeychainAccountKey];
    if (userName !=nil) {
        [dict setValue:[self aES256EncryptDataWithKey:KUserNameKey contentString:userName] forKey:KUserNameKey];
        
        //写数据到本地
        if ([self touchFile:_plistPath]) {
            [dict writeToFile:_plistPath atomically:YES];
        }else{
            
            XLog_ERROR(@"function:%s- %@ created faile",__FUNCTION__,_plistPath);
            
        }

    }
    
    //取数据
    NSString * nameString =@"";
    if ([dict[KUserNameKey] isKindOfClass:[NSData class]]) {
        nameString=[self aES256DecryptDataWithKey:KUserNameKey contentData:dict[KUserNameKey]];
    }else{
        nameString =dict[KUserNameKey];
    }
    
    return nameString;
}

///保存用户名
- (void)saveUserNameWith:(NSString*)userName{
    
    XLog_INFO(@"path:%@",_plistPath);
    
    [self saveSimpleString:userName simpleKey:KUserNameKey];
}

#pragma mark 密码读取操作
//读取
- (NSString *)passwordStringWithUserName:(NSString *)userName
{
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:_plistPath];
    
    //dict
    if (dict==nil) {
        dict=[NSMutableDictionary dictionary];
    }
    //获取密码
    NSString *password = [SSKeychain passwordForService:KPassWord account:userName];
    if (password !=nil) {
        [dict setValue:[self aES256EncryptDataWithKey:KPassWord contentString:password] forKey:KPassWord];
        
        //写数据到本地
        if ([self touchFile:_plistPath]) {
            [dict writeToFile:_plistPath atomically:YES];
        }else{
            
            XLog_ERROR(@"function:%s- %@ created faile",__FUNCTION__,_plistPath);
            
        }
        
    }
    
    //取数据
    NSString * passWordString =@"";
    if ([dict[KPassWord] isKindOfClass:[NSData class]]) {
        passWordString=[self aES256DecryptDataWithKey:KPassWord contentData:dict[KPassWord]];
    }else{
        passWordString =dict[KUserNameKey];
    }
    
    return passWordString;

}
///保存密码
- (void)savePassWordWith:(NSString*)password{
    
    XLog_INFO(@"path:%@",_plistPath);
    
    [self saveSimpleString:password simpleKey:KPassWord];
}

#pragma mark - 通用读取操作
- (void)saveSimpleString:(NSString *)simpleString simpleKey:(NSString *)simpleKey
{
    if ([self touchFile:_plistPath]) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:_plistPath];
        if (dict==nil) {
            dict=[NSMutableDictionary dictionary];
        }
        
        
        [dict setValue:[self aES256EncryptDataWithKey:simpleKey contentString:simpleString] forKey:simpleKey];
        [dict writeToFile:_plistPath atomically:YES];
    }else{
        
        XLog_ERROR(@"function:%s- %@ created faile",__FUNCTION__,_plistPath);
        
        
    }

}
- (NSString *)getSimpleStringWithSimpleKey:(NSString *)simpleKey
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:_plistPath];
    //取数据
    NSString * simpleString =@"";
    if ([dict[simpleKey] isKindOfClass:[NSData class]]) {
        simpleString=[self aES256DecryptDataWithKey:simpleKey contentData:dict[simpleKey]];
    }else{
        simpleString =dict[simpleKey];
    }
    
    return simpleString;
}


#pragma mark 工具方法
- (BOOL)touchFile:(NSString *)file
{
    if ( NO == [[NSFileManager defaultManager] fileExistsAtPath:file] )
    {
        return [[NSFileManager defaultManager] createFileAtPath:file
                                                       contents:[NSData data]
                                                     attributes:nil];
    }
    return YES;
}


- (NSData*)stringToDataWithString:(NSString *)string{

    return [string dataUsingEncoding:NSUTF8StringEncoding];
}

/*!
 *  @brief  返回AES256加密DATA
 *  @param  keyString 解密标志key
 *  @return content   待加密内容
 */
- (NSData*)aES256EncryptDataWithKey:(NSString *)keyString contentString:(NSString*)content{
    
    //1次加盐加密
    content = [content stringByAppendingString:RNADOMSTRING];//加盐
    NSData * contentData1 =[[self stringToDataWithString:content] AES256EncryptWithKey:keyString];
    
    //2次普通加密
    return [contentData1 AES256EncryptWithKey:keyString];
}
/*!
 *  @brief  返回AES256解密String
 *  @param  keyString 解密标志key
 *  @return data      加密数据
 */
- (NSString *)aES256DecryptDataWithKey:(NSString *)keyString contentData:(NSData*)data{
    //1次普通解密
    NSData *data1 =[data AES256DecryptWithKey:keyString];
    
    //2次去盐解密
    NSString * string =[[NSString alloc]initWithData:[data1 AES256DecryptWithKey:keyString] encoding:NSUTF8StringEncoding];
    //去盐
   return [string substringWithRange:NSMakeRange(0, string.length-RNADOMSTRING.length)];
}

@end
