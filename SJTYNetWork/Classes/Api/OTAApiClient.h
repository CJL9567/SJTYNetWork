//
//  OTAApiClient.h
//  SJTYNetWork
//
//  Created by sjty on 2022/7/12.
//

#import "BaseApiClient.h"

NS_ASSUME_NONNULL_BEGIN

@interface OTAApiClient : BaseApiClient


/// 获取ota列表
/// @param productSub 产品型号
/// @param responseHandler 回调
-(void)apiOTAApiQueryListWithProductSub:(NSString *)productSub  responseHandler:(ResponseHandler _Nonnull)responseHandler;

/// 获取最后上传的OTA文件
/// @param productSub 产品型号
/// @param responseHandler 回调
-(void)apiOTAApiQueryLastOTAWithProductSub:(NSString *)productSub  responseHandler:(ResponseHandler _Nonnull)responseHandler;


/// 下载OTA文件
/// @param otaPath OTA 文件下载地址
/// @param progressHandler 进度回调
/// @param responseHandler 回调
-(void)apiDownloadOTA:(NSString *)otaPath progressHandler:(ProgressHandler)progressHandler  responseHandler:(ResponseHandler _Nonnull)responseHandler;

@end

NS_ASSUME_NONNULL_END
