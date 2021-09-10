//
//  LikeApiClient.h
//  SJTYNetWork
//  点赞API
//  Created by sjty on 2021/9/10.
//

#import "BaseApiClient.h"

NS_ASSUME_NONNULL_BEGIN

@interface LikeApiClient : BaseApiClient

/// 点赞网页
/// @param htmlId 网页Id
/// @param responseHandler 回调
-(void)apiLikeHtml:(NSString *)htmlId responseHandler:(ResponseHandler _Nonnull)responseHandler;


/// 点赞用户
/// @param userId 网页Id
/// @param responseHandler 回调
-(void)apiLikeUser:(NSString *_Nonnull)userId responseHandler:(ResponseHandler _Nonnull)responseHandler;


/// 获取点赞数
/// @param toId 查询对象Id 网页Id、用户Id
/// @param responseHandler 回调
-(void)apiLikeNumber:(NSString *)toId responseHandler:(ResponseHandler _Nonnull)responseHandler;



@end

NS_ASSUME_NONNULL_END
