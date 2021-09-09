//
//  AdApiClient.m
//  SJTYNetWork
//
//  Created by sjty on 2021/9/9.
//

#import "AdApiClient.h"

@implementation AdApiClient


/// 获取最后的广告
/// @param adType 广告类型 （0启动页，1通知，2应用内,3推送）
/// @param responseHandler 回调
-(void)apiAdQueryLastWeek:(API_ADTYPE)adType responseHandler:(ResponseHandler _Nonnull)responseHandler{
    
    SJTYRequest *request=[[SJTYRequest alloc] init];
    request.apiUrl=[NSString stringWithFormat:@"/sjtyApi/app/adPutProduct/getLastWeek?type=%ld&productId=%@",(long)adType,self.prodcutID];
    request.responseMapClass=@"AdDataModel";
    [self getRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
}

/// 分页查询广告
/// @param adType 广告类型 （0启动页，1通知，2应用内,3推送）
/// @param page 当前页面
/// @param limit 每页数量
/// @param responseHandler 回调
-(void)apiAdQueryWithPage:(API_ADTYPE)adType page:(NSInteger)page limit:(NSInteger)limit responseHandler:(ResponseHandler _Nonnull)responseHandler{
    SJTYRequest *request=[[SJTYRequest alloc] init];
    request.apiUrl=[NSString stringWithFormat:@"/sjtyApi/app/adPutProduct/page?type=%ld&putProductId=%@&page=%ld&limit=%ld",(long)adType,self.prodcutID,page,(long)limit];
    request.responseMapClass=@"AdPageModel";
    request.mapClass=YES;
    [self getRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
}



-(void)apiUnLoginAdQueryLastWeek:(API_ADTYPE)adType responseHandler:(ResponseHandler _Nonnull)responseHandler{
    
    SJTYRequest *request=[[SJTYRequest alloc] init];
    request.apiUrl=[NSString stringWithFormat:@"/sjtyApi/app/adPutProduct/unlogin/getLastWeek?type=%ld&productId=%@",(long)adType,self.prodcutID];
    request.responseMapClass=@"AdDataModel";
    [self getRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
}


-(void)apiUnLoginAdQueryWithPage:(API_ADTYPE)adType page:(NSInteger)page limit:(NSInteger)limit responseHandler:(ResponseHandler _Nonnull)responseHandler{
    SJTYRequest *request=[[SJTYRequest alloc] init];
    request.apiUrl=[NSString stringWithFormat:@"/sjtyApi/app/adPutProduct/unlogin/page?type=%ld&putProductId=%@&page=%ld&limit=%ld",(long)adType,self.prodcutID,page,(long)limit];
    request.responseMapClass=@"AdPageModel";
    request.mapClass=YES;
    [self getRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
}



@end
