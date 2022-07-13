//
//  AppApiClient.h
//  SJTYNetWork
//
//  Created by sjty on 2021/11/23.
//

#import "BaseApiClient.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppApiClient : BaseApiClient

/// 查询App 是否能够正常使用
/// @param appId appID
/// @param responseHandler 回调 true 为能够使用 false为不能使用,直接退出App
-(void)apiAppEnable:(NSString *)appId responseHandler:(ResponseHandler _Nonnull)responseHandler;

///获取网页基础Url
/// @param responseHandler 回调
-(void)apiAppWebBaseUrl:(ResponseHandler)responseHandler;

///获取文件基础Url
/// @param responseHandler 返回文件的url
-(void)apiAppFileBaseUrl:(ResponseHandler _Nonnull)responseHandler;

@end

NS_ASSUME_NONNULL_END
