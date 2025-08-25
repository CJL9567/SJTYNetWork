//
//  AppApiClient.m
//  SJTYNetWork
//
//  Created by sjty on 2021/11/23.
//

#import "AppApiClient.h"

@implementation AppApiClient


/// 查询App 是否能够正常使用
/// @param appId appID
/// @param responseHandler 回调 true 为能够使用 false为不能使用,直接退出App 
-(void)apiAppEnable:(NSString *)appId responseHandler:(ResponseHandler _Nonnull)responseHandler{
    
    SJTYRequest *request=[[SJTYRequest alloc] init];
    request.apiUrl=[NSString stringWithFormat:@"/sjtyApi/app/product/checkState?id=%@",appId];
//    request.responseMapClass=@"AdDataModel";
    [self postRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
}

///获取网页基础Url
/// @param responseHandler 回调
-(void)apiAppWebBaseUrl:(ResponseHandler)responseHandler{
    SJTYRequest *request=[[SJTYRequest alloc] init];
    request.apiUrl=[NSString stringWithFormat:@"/sjtyApi/app/getWebBaseUrl"];
    [self getRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
}

///获取文件基础Url
/// @param responseHandler 返回文件的url
-(void)apiAppFileBaseUrl:(ResponseHandler)responseHandler{
    SJTYRequest *request=[[SJTYRequest alloc] init];
    request.apiUrl=[NSString stringWithFormat:@"/sjtyApi/app/getWebFileBaseUrl"];
    [self getRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
}



///根据经纬度获取城市
/// @param lat 纬度
/// @param lng 经度
/// @param responseHandler 回调
-(void)apiAppCityByLatLng:(NSString *)lat lng:(NSString *)lng responseHandler:(ResponseHandler _Nonnull)responseHandler{
    SJTYRequest *request=[[SJTYRequest alloc] init];
    request.apiUrl=[NSString stringWithFormat:@"/sjtyApi/app/getCityByLatLng?lat=%@&lng=%@",lat,lng];
    [self postRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
}


///根据经纬度获取位置信息
/// @param lat 纬度
/// @param lng 经度
/// @param responseHandler 回调
-(void)apiAppDistrictByLatLng:(NSString *)lat lng:(NSString *)lng responseHandler:(ResponseHandler _Nonnull)responseHandler{
    SJTYRequest *request=[[SJTYRequest alloc] init];
    request.apiUrl=[NSString stringWithFormat:@"/sjtyApi/app/getDistrictByLatLng?lat=%@&lng=%@",lat,lng];
    [self postRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
}


@end

