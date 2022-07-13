//
//  OTAApiClient.m
//  SJTYNetWork
//
//  Created by sjty on 2022/7/12.
//

#import "OTAApiClient.h"

@implementation OTAApiClient

/// 获取ota列表
/// @param productSub 产品型号
/// @param responseHandler 回调
-(void)apiOTAApiQueryListWithProductSub:(NSString *)productSub  responseHandler:(ResponseHandler _Nonnull)responseHandler{
    
    SJTYRequest *request=[[SJTYRequest alloc] init];
    request.apiUrl=[NSString stringWithFormat:@"/sjtyApi/app/ota/list?productId=%@&productSub=%@",self.prodcutID,productSub];
    request.mapClass=NO;
    request.responseMapClass=@"OTAModel";
    [self postRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
    
    
}

/// 获取最后上传的OTA文件
/// @param productSub 产品型号
/// @param responseHandler 回调
-(void)apiOTAApiQueryLastOTAWithProductSub:(NSString *)productSub  responseHandler:(ResponseHandler _Nonnull)responseHandler{
    
    SJTYRequest *request=[[SJTYRequest alloc] init];
    request.apiUrl=[NSString stringWithFormat:@"/sjtyApi/app/ota/last?productId=%@&productSub=%@",self.prodcutID,productSub];
    request.mapClass=YES;
    request.responseMapClass=@"OTAModel";
    [self postRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
    
    
}

-(void)apiDownloadOTA:(NSString *)otaPath progressHandler:(ProgressHandler)progressHandler  responseHandler:(ResponseHandler _Nonnull)responseHandler{
    SJTYRequest *request=[[SJTYRequest alloc] init];

    request.apiUrl=[NSString stringWithFormat:@"%@",otaPath];

    request.fileName=[otaPath substringFromIndex:[otaPath rangeOfString:@"/" options:NSBackwardsSearch].location+[otaPath rangeOfString:@"/" options:NSBackwardsSearch].length];

    [self downloadFile:request progressHandler:^(NSProgress * _Nonnull uploadProgress) {
        progressHandler(uploadProgress);
    } responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
            responseHandler(error,response);
    }];
    
}





@end
