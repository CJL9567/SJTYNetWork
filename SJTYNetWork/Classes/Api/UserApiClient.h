//
//  UserApiClient.h
//  SJTYNetWork
//
//  Created by sjty on 2021/9/8.
//

#import "BaseApiClient.h"


@interface UserApiClient : BaseApiClient



/// 校验Session
/// @param responseHandler 回调
-(void)apiCheckSessionHandler:(ResponseHandler _Nonnull)responseHandler;



/// 获取验证码
/// @param contactKey 邮箱、手机号码
/// @param simulation 模拟发送，1 时不实际发送验证码，验证码0000
/// @param responseHandler 回调
-(void)apiCode:(NSString * _Nonnull)contactKey simulation:(Boolean)simulation responseHandler:(ResponseHandler _Nonnull)responseHandler;

#pragma warn 与上一条获取验证码的区别在于本验证码会校验是否存在输入的账号

/// 获取重置密码验证码 ---->>>
/// @param contactKey 邮箱、手机号码
/// @param simulation 模拟发送，1 时不实际发送验证码，验证码0000
/// @param responseHandler 回调
-(void)apiRestCode:(NSString * _Nonnull)contactKey simulation:(Boolean)simulation responseHandler:(ResponseHandler _Nonnull)responseHandler;


/// 注册用户
/// @param contactKey 邮箱、手机号码
/// @param password 密码
/// @param code 验证码
/// @param params 其他参数
/// @param responseHandler 回调
-(void)apiRegisterUser:(NSString * _Nonnull)contactKey password:(NSString * _Nonnull)password code:(NSString * _Nonnull)code otheParams:(NSDictionary * _Nullable) params responseHandler:(ResponseHandler _Nonnull )responseHandler;


/// 用验证码登录或注册
/// 如果账号已注册则是登录接口，不会修改设置任何用户信息
/// @param contactKey 邮箱、手机号码
/// @param password 密码
/// @param code 验证码
/// @param params 其他参数
/// @param responseHandler 回调
-(void)apiRegisterOrLogin:(NSString * _Nonnull)contactKey password:(NSString * _Nullable )password code:(NSString * _Nonnull)code otheParams:(NSDictionary * _Nullable) params responseHandler:(ResponseHandler _Nonnull )responseHandler;



/// 第三方登录
/// @param tripartiteLoginKey 第三方平台唯一码
/// @param tripartiteLoginType 平台类型 如Wechat、QQ、Facebook等
/// @param params 其他参数
/// @param responseHandler 回调
-(void)apiLoginWithTripartite:(NSString * _Nonnull)tripartiteLoginKey tripartiteLoginType:(NSString * _Nonnull)tripartiteLoginType otheParams:(NSDictionary * _Nullable) params responseHandler:(ResponseHandler _Nonnull )responseHandler;


/// 账号密码登录
/// @param contactKey 邮箱、手机号码
/// @param password 密码
/// @param responseHandler 回调
-(void)apiLogin:(NSString * _Nonnull)contactKey password:(NSString * _Nonnull )password responseHandler:(ResponseHandler _Nonnull )responseHandler;



/// 通过验证码修改用户密码
/// @param contactKey 邮箱、手机号码
/// @param password  密码
/// @param code 验证码
/// @param responseHandler 回调
-(void)apiUpdatePwd:(NSString * _Nonnull)contactKey password:(NSString * _Nonnull )password code:(NSString * _Nonnull)code responseHandler:(ResponseHandler _Nonnull )responseHandler;



/// 通过验证码修改账户 --->类似更换手机号的功能
/// @param contactKey 邮箱、手机号码
/// @param code 验证码
/// @param responseHandler 回调
-(void)apiUpdateContactKey:(NSString * _Nonnull)contactKey code:(NSString * _Nonnull)code responseHandler:(ResponseHandler _Nonnull )responseHandler;


/// 退出登录
/// @param responseHandler 回调
-(void)apiLogoutHandler:(ResponseHandler _Nonnull )responseHandler;



/// 删除账号
/// @param responseHandler 回调
-(void)apiDeleteAccount:(ResponseHandler _Nonnull )responseHandler;


/// 上传用户位置信息,用于后台进行数据统计或按区域推送消息
/// @param longitude 经度
/// @param latitude 纬度
/// @param responseHandler 回调
-(void)apiLocation:(NSString * _Nonnull)longitude  latitude:(NSString * _Nonnull)latitude  responseHandler:(ResponseHandler _Nonnull )responseHandler;



/// 查询用户信息
/// @param responseHandler 回调
-(void)apiQueryUserInfoHandler:(ResponseHandler _Nonnull )responseHandler;



/// 更新用户数据
/// @param params 用户信息参数 内容参考 ClientUserModel 类
/// @param responseHandler 回调
-(void)apiUpdateUserInfo:(NSDictionary * _Nonnull)params responseHandler:(ResponseHandler _Nonnull )responseHandler;



/// 上传文件
/// @param fileArray 文件内容
/// @param progressHandler 进度回调
/// @param responseHandler 回调
-(void)apiUploadFile:(NSArray <NSData *> * _Nonnull)fileArray progressHandler:(ProgressHandler _Nullable)progressHandler responseHandler:(ResponseHandler _Nonnull)responseHandler;




@end
