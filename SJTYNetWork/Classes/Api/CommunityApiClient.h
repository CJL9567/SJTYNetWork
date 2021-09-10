//
//  CommunityApiClient.h
//  SJTYNetWork
//  社群Api
//  Created by sjty on 2021/9/10.
//

#import "BaseApiClient.h"

NS_ASSUME_NONNULL_BEGIN

@interface CommunityApiClient : BaseApiClient


/// 发表评论
/// @param referenceId 评论ID 产品ID、用户ID、评论ID
/// @param content 评论呢日
/// @param responseHandler 回调
-(void)apiCommunitySpeak:(NSString *)referenceId  content:(NSString *)content responseHandler:(ResponseHandler _Nonnull)responseHandler;



/// 分页查询评论
/// @param referenceId 评论ID
/// @param page 页码
/// @param limit limit
/// @param responseHandler 回调
-(void)apiCommunityPage:(NSString *)referenceId  page:(NSInteger)page limit:(NSInteger )limit responseHandler:(ResponseHandler _Nonnull)responseHandler;




@end

NS_ASSUME_NONNULL_END
