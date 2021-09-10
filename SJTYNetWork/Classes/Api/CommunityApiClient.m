//
//  CommunityApiClient.m
//  SJTYNetWork
//
//  Created by sjty on 2021/9/10.
//

#import "CommunityApiClient.h"

@implementation CommunityApiClient


/// 发表评论
/// @param referenceId 评论ID 产品ID、用户ID、评论ID
/// @param content 评论呢日
/// @param responseHandler 回调
-(void)apiCommunitySpeak:(NSString *)referenceId  content:(NSString *)content responseHandler:(ResponseHandler _Nonnull)responseHandler{
    
    SJTYRequest *request=[[SJTYRequest alloc] init];
    request.apiUrl=[NSString stringWithFormat:@"/sjtyApi/app/commentary/speak?refId=%@&content=%@",referenceId,content];
    
    [self postRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
    
}

/// 分页查询评论
/// @param referenceId 评论ID
/// @param page 页码
/// @param limit limit
/// @param responseHandler 回调
-(void)apiCommunityPage:(NSString *)referenceId  page:(NSInteger)page limit:(NSInteger )limit responseHandler:(ResponseHandler _Nonnull)responseHandler{
    
    
    SJTYRequest *request=[[SJTYRequest alloc] init];
    request.apiUrl=[NSString stringWithFormat:@"/sjtyApi/app/commentary/page?refId=%@&page=%ld&limit=%ld",referenceId,(long)page,limit];
    request.mapClass=YES;
    request.responseMapClass=@"CommunityPageModel";
    [self getRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
    
}



@end
