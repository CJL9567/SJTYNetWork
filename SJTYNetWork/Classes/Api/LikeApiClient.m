//
//  LikeApiClient.m
//  SJTYNetWork
//
//  Created by sjty on 2021/9/10.
//

#import "LikeApiClient.h"

@implementation LikeApiClient


/// 点赞用户
/// @param userId 网页Id
/// @param responseHandler 回调
-(void)apiLikeUser:(NSString *)userId responseHandler:(ResponseHandler _Nonnull)responseHandler{
    SJTYRequest *request=[[SJTYRequest alloc] init];
    request.apiUrl=[NSString stringWithFormat:@"/sjtyApi/app/top/addWithUser?toId=%@",userId];
    
    [self postRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
}



/// 点赞网页
/// @param htmlId 网页Id
/// @param responseHandler 回调
-(void)apiLikeHtml:(NSString *)htmlId responseHandler:(ResponseHandler _Nonnull)responseHandler{
    SJTYRequest *request=[[SJTYRequest alloc] init];
    request.apiUrl=[NSString stringWithFormat:@"/sjtyApi/app/top/addWithHtml?toId=%@",htmlId];
    
    [self postRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
}


/// 获取点赞数
/// @param toId 查询对象Id 网页Id、用户Id
/// @param responseHandler 回调
-(void)apiLikeNumber:(NSString *)toId responseHandler:(ResponseHandler _Nonnull)responseHandler{
    SJTYRequest *request=[[SJTYRequest alloc] init];
    request.apiUrl=[NSString stringWithFormat:@"/sjtyApi/app/top/getTopNum?toId=%@",toId];
    
    [self getRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
}


@end
