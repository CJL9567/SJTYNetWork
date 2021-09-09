//
//  UserApiClient.m
//  SJTYNetWork
//
//  Created by sjty on 2021/9/8.
//

#import "UserApiClient.h"


@interface UserApiClient ()

@end

@implementation UserApiClient



/// 校验Session
/// @param responseHandler 回调
-(void)apiCheckSessionHandler:(ResponseHandler _Nonnull)responseHandler{
    
    SJTYRequest *request=[[SJTYRequest alloc] init];
    request.apiUrl=[NSString stringWithFormat:@"/sjtyApi/app/checkSession"];
    
    [self postRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
    
}


/// 获取验证码
/// @param contactKey 邮箱、手机号码
/// @param simulation 模拟发送，1 时不实际发送验证码，验证码0000
/// @param responseHandler 回调
-(void)apiCode:(NSString *)contactKey simulation:(Boolean)simulation responseHandler:(ResponseHandler )responseHandler{
    
    NSArray*languages = [NSLocale preferredLanguages];
    NSString*currentLanguage = [languages objectAtIndex:0];
    NSString *language=@"zh_CN";
    if ([currentLanguage containsString:@"zh-Han"]) {
        language=@"zh_CN";
    }else{
        language=@"en_US";
    }
    SJTYRequest *request=[[SJTYRequest alloc] init];
    
    request.apiUrl=[NSString stringWithFormat:@"/sjtyApi/app/sendCode_1?contactKey=%@&productId=%@&language=%@&simulation=%d",contactKey,self.prodcutID,language,simulation];
    
    [self postRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
}


/// 获取重置密码验证码
/// @param contactKey 邮箱、手机号码
/// @param simulation 模拟发送，1 时不实际发送验证码，验证码0000
/// @param responseHandler 回调
-(void)apiRestCode:(NSString *)contactKey simulation:(Boolean)simulation responseHandler:(ResponseHandler )responseHandler{
    
    NSArray*languages = [NSLocale preferredLanguages];
    NSString*currentLanguage = [languages objectAtIndex:0];
    NSString *language=@"zh_CN";
    if ([currentLanguage containsString:@"zh-Han"]) {
        language=@"zh_CN";
    }else{
        language=@"en_US";
    }
    SJTYRequest *request=[[SJTYRequest alloc] init];
    
    request.apiUrl=[NSString stringWithFormat:@"/sjtyApi/app/resetPwdByContactKey?contactKey=%@&productId=%@&language=%@&simulation=%d",contactKey,self.prodcutID,language,simulation];
    
    [self postRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
}


/// 注册用户
/// @param contactKey 邮箱、手机号码
/// @param password 密码
/// @param code 验证码
/// @param params 其他参数
/// @param responseHandler 回调
-(void)apiRegisterUser:(NSString * _Nonnull)contactKey password:(NSString * _Nonnull)password code:(NSString * _Nonnull)code otheParams:(NSDictionary *) params responseHandler:(ResponseHandler )responseHandler;{
    
    SJTYRequest *request=[[SJTYRequest alloc] init];
    
    request.apiUrl=@"/sjtyApi/app/registerWithAll";
    NSMutableDictionary *dictionary=[NSMutableDictionary dictionary];
     
    NSDictionary *dict=@{@"contactKey":contactKey,
                         @"productId":self.prodcutID,
                         @"password":password,
                         @"code":code
    };
    [dictionary addEntriesFromDictionary:dict];
    if (params!=nil) {
        [dictionary addEntriesFromDictionary:params];
    }
    
    request.params=dictionary;
    
    [self postRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
        
    }];
    
}


/// 用验证码登录或注册
/// 如果账号已注册则是登录接口，不会修改设置任何用户信息
/// @param contactKey 邮箱、手机号码
/// @param password 密码
/// @param code 验证码
/// @param params 其他参数
/// @param responseHandler 回调
-(void)apiRegisterOrLogin:(NSString * _Nonnull)contactKey password:(NSString * _Nullable )password code:(NSString * _Nonnull)code otheParams:(NSDictionary * _Nullable) params responseHandler:(ResponseHandler _Nonnull )responseHandler{
    
    SJTYRequest *request=[[SJTYRequest alloc] init];
    
    request.apiUrl=@"/sjtyApi/app/loginAndReg";
    NSMutableDictionary *dictionary=[NSMutableDictionary dictionary];
    [dictionary setValue:contactKey forKey:@"contactKey"];
    [dictionary setValue:self.prodcutID forKey:@"productId"];
    [dictionary setValue:code forKey:@"code"];
    
    if (password!=nil) {
        [dictionary setValue:password forKey:@"password"];
    }
    if (params!=nil) {
        [dictionary addEntriesFromDictionary:params];
    }
    
    request.params=dictionary;
    
    [self postRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
    
}



/// 第三方登录
/// @param tripartiteLoginKey 第三方平台唯一码
/// @param tripartiteLoginType 平台类型 如Wechat、QQ、Facebook等
/// @param params 其他参数
/// @param responseHandler 回调
-(void)apiLoginWithTripartite:(NSString * _Nonnull)tripartiteLoginKey tripartiteLoginType:(NSString *)tripartiteLoginType otheParams:(NSDictionary * _Nullable) params responseHandler:(ResponseHandler _Nonnull )responseHandler{
    
    SJTYRequest *request=[[SJTYRequest alloc] init];
    
    request.apiUrl=@"/sjtyApi/app/loginWithTripartite";
    NSMutableDictionary *dictionary=[NSMutableDictionary dictionary];
    [dictionary setValue:tripartiteLoginKey forKey:@"tripartiteLoginKey"];
    [dictionary setValue:tripartiteLoginType forKey:@"tripartiteLoginType"];
    [dictionary setValue:self.prodcutID forKey:@"productId"];
    if (params!=nil) {
        [dictionary addEntriesFromDictionary:params];
    }
    
    request.params=dictionary;
    
    [self postRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
    
}




/// 账号密码登录
/// @param contactKey 邮箱、手机号码
/// @param password 密码
/// @param responseHandler 回调
-(void)apiLogin:(NSString * _Nonnull)contactKey password:(NSString * _Nonnull )password responseHandler:(ResponseHandler _Nonnull )responseHandler{
    SJTYRequest *request=[[SJTYRequest alloc] init];
    request.apiUrl=[NSString stringWithFormat:@"/sjtyApi/app/login?contactKey=%@&productId=%@&password=%@",contactKey,self.prodcutID,password];
    
    [self postRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
}


/// 通过验证码修改账户 --->类似更换手机号的功能
/// @param contactKey 邮箱、手机号码
/// @param code 验证码
/// @param responseHandler 回调
-(void)apiUpdateContactKey:(NSString * _Nonnull)contactKey code:(NSString * _Nonnull)code responseHandler:(ResponseHandler _Nonnull )responseHandler{
    SJTYRequest *request=[[SJTYRequest alloc] init];
    request.apiUrl=[NSString stringWithFormat:@"/sjtyApi/app/updatePhoneOrEmailByCode?contactKey=%@&productId=%@&code=%@",contactKey,self.prodcutID,code];
    
    [self postRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
}

/// 通过验证码修改用户密码
/// @param contactKey 邮箱、手机号码
/// @param password  密码
/// @param code 验证码
/// @param responseHandler 回调
-(void)apiUpdatePwd:(NSString * _Nonnull)contactKey password:(NSString * _Nonnull )password code:(NSString * _Nonnull)code responseHandler:(ResponseHandler _Nonnull )responseHandler{
    SJTYRequest *request=[[SJTYRequest alloc] init];
    request.apiUrl=[NSString stringWithFormat:@"/sjtyApi/app/updatePwdByCode?contactKey=%@&productId=%@&password=%@&code=%@",contactKey,self.prodcutID,password,code];
    
    [self postRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
}



/// 退出登录
/// @param responseHandler 回调
-(void)apiLogoutHandler:(ResponseHandler _Nonnull )responseHandler{
    
    SJTYRequest *request=[[SJTYRequest alloc] init];
    request.apiUrl=[NSString stringWithFormat:@"/sjtyApi/app/logout"];
    
    [self postRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
}



/// 上传用户位置信息,用于后台进行数据统计或按区域推送消息
/// @param longitude 经度
/// @param latitude 纬度
/// @param responseHandler 回调
-(void)apiLocation:(NSString *)longitude  latitude:(NSString *)latitude  responseHandler:(ResponseHandler _Nonnull )responseHandler{
    SJTYRequest *request=[[SJTYRequest alloc] init];
    request.apiUrl=[NSString stringWithFormat:@"/sjtyApi/app/clientUser/setLngLat?lat=%@&lng=%@",longitude,latitude];
    
    [self postRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
}

/// 查询用户信息
/// @param responseHandler 回调
-(void)apiQueryUserInfoHandler:(ResponseHandler _Nonnull )responseHandler{
    SJTYRequest *request=[[SJTYRequest alloc] init];
    request.apiUrl=[NSString stringWithFormat:@"/sjtyApi/app/clientUser/getSelfInfo"];
    request.mapClass=YES;
    request.responseMapClass=@"ClientUserModel";
    [self getRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
}

/// 更新用户数据
/// @param params 用户信息参数 内容参考 ClientUserModel 类
/// @param responseHandler 回调
-(void)apiUpdateUserInfo:(NSDictionary *)params responseHandler:(ResponseHandler _Nonnull )responseHandler{
    
    SJTYRequest *request=[[SJTYRequest alloc] init];
    request.apiUrl=[NSString stringWithFormat:@"/sjtyApi/app/clientUser/update"];
    
    NSMutableDictionary *dictionary=[NSMutableDictionary dictionary];
    if (params!=nil) {
        [dictionary addEntriesFromDictionary:params];
    }
    [dictionary setValue:self.prodcutID forKey:@"productId"];
    request.params=dictionary;
    
    [self putRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
       
        responseHandler(error,response);
        
    }];
}


-(void)apiUploadFile:(NSArray <NSData *> * _Nonnull)fileArray progressHandler:(ProgressHandler _Nullable)progressHandler responseHandler:(ResponseHandler _Nonnull)responseHandler{
    
    SJTYRequest *request=[[SJTYRequest alloc] init];
    request.apiUrl=[NSString stringWithFormat:@"/sjtyApi/app/clientUser/updatePortrait"];
    request.timeoutInterval=60*2;
    request.fileArray=fileArray;
    
    [self postUploadFile:request progressHandler:^(NSProgress * _Nonnull uploadProgress) {
        progressHandler(uploadProgress);
    } responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
    
    
}



@end
