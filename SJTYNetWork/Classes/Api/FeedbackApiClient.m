//
//  FeedbackApiClient.m
//  SJTYNetWork
//
//  Created by sjty on 2021/9/10.
//

#import "FeedbackApiClient.h"

@implementation FeedbackApiClient

/// 添加意见反馈
/// @param content 反馈内容
/// @param contacts 联系方式
/// @param responseHandler 回调
-(void)apiFeedbackAdd:(NSString *)content contacts:(NSString *)contacts responseHandler:(ResponseHandler _Nonnull)responseHandler{
   
    SJTYRequest *request=[[SJTYRequest alloc] init];
    
    request.apiUrl=@"/sjtyApi/app/feedback/add";
    NSMutableDictionary *dictionary=[NSMutableDictionary dictionary];
    [dictionary setValue:content forKey:@"context"];
    [dictionary setValue:self.prodcutID forKey:@"productId"];
    if (contacts!=nil) {
        [dictionary setValue:contacts forKey:@"contacts"];
    }
    
    request.params=dictionary;
    
    [self postRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
    
}

/// 查询历史意见反馈
/// @param responseHandler 回调
-(void)apiFeedbackQueryListHandler:(ResponseHandler _Nonnull)responseHandler{
    SJTYRequest *request=[[SJTYRequest alloc] init];
    
    request.apiUrl=@"/sjtyApi/app/feedback/getList";
    request.responseMapClass=@"FeedbackModel";
    
    [self getRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
}



/// 不登录添加意见反馈
/// @param content 反馈内容
/// @param contacts 联系方式
/// @param responseHandler 回调
-(void)apiFeedbackUnloginAdd:(NSString * _Nonnull)content contacts:(NSString * _Nonnull)contacts responseHandler:(ResponseHandler _Nonnull)responseHandler{
 
    SJTYRequest *request=[[SJTYRequest alloc] init];
    
    request.apiUrl=@"/sjtyApi/app/feedback/unlogin/add";
    NSMutableDictionary *dictionary=[NSMutableDictionary dictionary];
    [dictionary setValue:content forKey:@"context"];
    [dictionary setValue:self.prodcutID forKey:@"productId"];
    if (contacts!=nil) {
        [dictionary setValue:contacts forKey:@"contacts"];
    }
    
    request.params=dictionary;
    
    [self postRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
}

@end
