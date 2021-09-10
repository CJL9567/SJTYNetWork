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


///不登录直接获取
/// 获取最后的广告
/// @param adType 广告类型 （0启动页，1通知，2应用内,3推送）
/// @param responseHandler 回调
-(void)apiUnLoginAdQueryLastWeek:(API_ADTYPE)adType responseHandler:(ResponseHandler _Nonnull)responseHandler{
    
    SJTYRequest *request=[[SJTYRequest alloc] init];
    request.apiUrl=[NSString stringWithFormat:@"/sjtyApi/app/adPutProduct/unlogin/getLastWeek?type=%ld&productId=%@",(long)adType,self.prodcutID];
    request.responseMapClass=@"AdDataModel";
    [self getRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
}

///不登录直接获取
/// 分页查询广告
/// @param adType 广告类型 （0启动页，1通知，2应用内,3推送）
/// @param page 当前页面
/// @param limit 每页数量
/// @param responseHandler 回调
-(void)apiUnLoginAdQueryWithPage:(API_ADTYPE)adType page:(NSInteger)page limit:(NSInteger)limit responseHandler:(ResponseHandler _Nonnull)responseHandler{
    SJTYRequest *request=[[SJTYRequest alloc] init];
    request.apiUrl=[NSString stringWithFormat:@"/sjtyApi/app/adPutProduct/unlogin/page?type=%ld&putProductId=%@&page=%ld&limit=%ld",(long)adType,self.prodcutID,page,(long)limit];
    request.responseMapClass=@"AdPageModel";
    request.mapClass=YES;
    [self getRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
}



/// 极光推送设置
/// @param registrationId 从激光获取
/// @param tag 产品id串_地区 (其中地区字符串中如果有空格需要用_代替，极光后台在tag有空格时会发送不出去)
/// @param responseHandler 回调
-(void)apiAdJpush:(NSString *)registrationId tag:(NSString *)tag responseHandler:(ResponseHandler _Nonnull)responseHandler{
    
    
    SJTYRequest *request=[[SJTYRequest alloc] init];
    
    request.apiUrl=@"/sjtyApi/app/jpush/add";
    NSMutableDictionary *dictionary=[NSMutableDictionary dictionary];
    [dictionary setValue:registrationId forKey:@"registrationId"];
    [dictionary setValue:tag forKey:@"tag"];
    [dictionary setValue:self.prodcutID forKey:@"productId"];
    
    request.params=dictionary;
    
    [self postRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
    
}

@end
