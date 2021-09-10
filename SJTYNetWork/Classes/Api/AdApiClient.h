//
//  AdApiClient.h
//  SJTYNetWork
//  广告相关Api
//  Created by sjty on 2021/9/9.
//

#import "BaseApiClient.h"

NS_ASSUME_NONNULL_BEGIN


typedef enum : NSUInteger {
    ///启动页
    API_ADTYPE_LAUNCH=0x00,
    ///通知
    API_ADTYPE_NOTIFY,
    ///应用内
    API_ADTYPE_APP,
    ///推送
    API_ADTYPE_PUSH
} API_ADTYPE; ///广告类型

///广告相关Api
@interface AdApiClient : BaseApiClient

/// 获取最后的广告
/// @param adType 广告类型 （0启动页，1通知，2应用内,3推送）
/// @param responseHandler 回调
-(void)apiAdQueryLastWeek:(API_ADTYPE)adType responseHandler:(ResponseHandler _Nonnull)responseHandler;



/// 分页查询广告
/// @param adType 广告类型 （0启动页，1通知，2应用内,3推送）
/// @param page 当前页面
/// @param limit 每页数量
/// @param responseHandler 回调
-(void)apiAdQueryWithPage:(API_ADTYPE)adType page:(NSInteger)page limit:(NSInteger)limit responseHandler:(ResponseHandler _Nonnull)responseHandler;


///不登录直接获取
/// 获取最后的广告
/// @param adType 广告类型 （0启动页，1通知，2应用内,3推送）
/// @param responseHandler 回调
-(void)apiUnLoginAdQueryLastWeek:(API_ADTYPE)adType responseHandler:(ResponseHandler _Nonnull)responseHandler;


///不登录直接获取
/// 分页查询广告
/// @param adType 广告类型 （0启动页，1通知，2应用内,3推送）
/// @param page 当前页面
/// @param limit 每页数量
/// @param responseHandler 回调
-(void)apiUnLoginAdQueryWithPage:(API_ADTYPE)adType page:(NSInteger)page limit:(NSInteger)limit responseHandler:(ResponseHandler _Nonnull)responseHandler;



/// 极光推送设置
/// @param registrationId 从激光获取
/// @param tag 产品id串_地区 (其中地区字符串中如果有空格需要用_代替，极光后台在tag有空格时会发送不出去)
/// @param responseHandler 回调
-(void)apiAdJpush:(NSString *)registrationId tag:(NSString *)tag responseHandler:(ResponseHandler _Nonnull)responseHandler;



@end

NS_ASSUME_NONNULL_END
