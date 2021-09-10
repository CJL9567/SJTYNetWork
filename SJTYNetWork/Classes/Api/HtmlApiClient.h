//
//  HtmlApiClient.h
//  SJTYNetWork
//
//  Created by sjty on 2021/9/9.
//

#import "BaseApiClient.h"

NS_ASSUME_NONNULL_BEGIN


@interface HtmlApiClient : BaseApiClient


/// 获取关于我们网页
/// @param language 语言 默认英文  zh-CN 、en-US
/// @param responseHandler 回调
-(void)apiHtmlAboutUs:(LANGUAGE)language responseHandler:(ResponseHandler _Nonnull)responseHandler;



/// 获取隐私政策
/// @param language language 语言 默认英文  zh-CN 、en-US
/// @param responseHandler 回调
-(void)apiHtmlPrivacyPolicy:(LANGUAGE)language responseHandler:(ResponseHandler _Nonnull)responseHandler;


/// 获取产品使用说明
/// @param language language 语言 默认英文  zh-CN 、en-US
/// @param responseHandler 回调
-(void)apiHtmlProcedures:(LANGUAGE)language responseHandler:(ResponseHandler _Nonnull)responseHandler;



/// 获取用户手册
/// @param language language 语言 默认英文  zh-CN 、en-US
/// @param responseHandler 回调
-(void)apiHtmlProtocol:(LANGUAGE)language responseHandler:(ResponseHandler _Nonnull)responseHandler;



/// 浏览指定网页
/// @param htmlId 网页Id
/// @param responseHandler 回调
-(void)apiHtmlBrowse:(NSString *)htmlId  responseHandler:(ResponseHandler _Nonnull)responseHandler;





@end

NS_ASSUME_NONNULL_END
