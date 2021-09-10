//
//  FeedbackApiClient.h
//  SJTYNetWork
//
//  Created by sjty on 2021/9/10.
//

#import "BaseApiClient.h"


@interface FeedbackApiClient : BaseApiClient


/// 添加意见反馈
/// @param content 反馈内容
/// @param contacts 联系方式
/// @param responseHandler 回调
-(void)apiFeedbackAdd:(NSString *_Nonnull)content contacts:(NSString * _Nullable )contacts responseHandler:(ResponseHandler _Nonnull)responseHandler;


/// 查询历史意见反馈
/// @param responseHandler 回调
-(void)apiFeedbackQueryListHandler:(ResponseHandler _Nonnull)responseHandler;


/// 不登录添加意见反馈
/// @param content 反馈内容
/// @param contacts 联系方式
/// @param responseHandler 回调
-(void)apiFeedbackUnloginAdd:(NSString * _Nonnull)content contacts:(NSString * _Nonnull)contacts responseHandler:(ResponseHandler _Nonnull)responseHandler;



@end

