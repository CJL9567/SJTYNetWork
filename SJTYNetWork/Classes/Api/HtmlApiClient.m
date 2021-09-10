//
//  HtmlApiClient.m
//  SJTYNetWork
//
//  Created by sjty on 2021/9/9.
//

#import "HtmlApiClient.h"

@implementation HtmlApiClient

/// 获取关于我们网页
/// @param language 语言 默认英文  zh-CN 、en-US
/// @param responseHandler 回调
-(void)apiHtmlAboutUs:(LANGUAGE) language responseHandler:(ResponseHandler _Nonnull)responseHandler{
    
    NSString *lang=@"en-US";
    if (language==LANGUAGE_EN) {
        lang=@"en-US";
    }else if (language==LANGUAGE_CN){
        lang=@"zh-CN";
    }else if (language==LANGUAGE_CN_TW){
        lang=@"zh-TW";
    }else if (language==LANGUAGE_JP){
        lang=@"ja-JP";
    }
    SJTYRequest *request=[[SJTYRequest alloc] init];
    request.apiUrl=[NSString stringWithFormat:@"/sjtyApi/app/html/getAboutUs?productId=%@&lang=%@",self.prodcutID,lang];
    [self getRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
    
}


/// 获取隐私政策
/// @param language language 语言 默认英文  zh-CN 、en-US
/// @param responseHandler 回调
-(void)apiHtmlPrivacyPolicy:(LANGUAGE)language responseHandler:(ResponseHandler _Nonnull)responseHandler{
    
    NSString *lang=@"en-US";
    if (language==LANGUAGE_EN) {
        lang=@"en-US";
    }else if (language==LANGUAGE_CN){
        lang=@"zh-CN";
    }else if (language==LANGUAGE_CN_TW){
        lang=@"zh-TW";
    }else if (language==LANGUAGE_JP){
        lang=@"ja-JP";
    }
    SJTYRequest *request=[[SJTYRequest alloc] init];
    request.apiUrl=[NSString stringWithFormat:@"/sjtyApi/app/html/getPrivacyPolicy?productId=%@&lang=%@",self.prodcutID,lang];
    [self getRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
}

/// 获取产品使用说明
/// @param language language 语言 默认英文  zh-CN 、en-US
/// @param responseHandler 回调
-(void)apiHtmlProcedures:(LANGUAGE)language responseHandler:(ResponseHandler _Nonnull)responseHandler{
    NSString *lang=@"en-US";
    if (language==LANGUAGE_EN) {
        lang=@"en-US";
    }else if (language==LANGUAGE_CN){
        lang=@"zh-CN";
    }else if (language==LANGUAGE_CN_TW){
        lang=@"zh-TW";
    }else if (language==LANGUAGE_JP){
        lang=@"ja-JP";
    }
    SJTYRequest *request=[[SJTYRequest alloc] init];
    request.apiUrl=[NSString stringWithFormat:@"/sjtyApi/app/html/getProcedures?productId=%@&lang=%@",self.prodcutID,lang];
    [self getRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
}

/// 获取用户手册
/// @param language language 语言 默认英文  zh-CN 、en-US
/// @param responseHandler 回调
-(void)apiHtmlProtocol:(LANGUAGE)language responseHandler:(ResponseHandler _Nonnull)responseHandler{

    NSString *lang=@"en-US";
    if (language==LANGUAGE_EN) {
        lang=@"en-US";
    }else if (language==LANGUAGE_CN){
        lang=@"zh-CN";
    }else if (language==LANGUAGE_CN_TW){
        lang=@"zh-TW";
    }else if (language==LANGUAGE_JP){
        lang=@"ja-JP";
    }
    SJTYRequest *request=[[SJTYRequest alloc] init];
    request.apiUrl=[NSString stringWithFormat:@"/sjtyApi/app/html/getProtocol?productId=%@&lang=%@",self.prodcutID,lang];
    [self getRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
}



/// 浏览指定网页
/// @param htmlId 网页Id
/// @param responseHandler 回调
-(void)apiHtmlBrowse:(NSString *)htmlId  responseHandler:(ResponseHandler _Nonnull)responseHandler{
    
    SJTYRequest *request=[[SJTYRequest alloc] init];
    request.apiUrl=[NSString stringWithFormat:@"/sjtyApi/app/see/addWithHtml?toId=%@",htmlId];
    
    [self postRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
    
}



@end
