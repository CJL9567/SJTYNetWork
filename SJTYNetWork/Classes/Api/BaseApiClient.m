//
//  BaseApiClient.m
//  SJTYNetWork
//
//  Created by sjty on 2021/9/8.
//

#import "BaseApiClient.h"

#import <AFNetworking/AFNetworking.h>
#import <MJExtension.h>
#import <CoreTelephony/CTCellularData.h>

#define Host @"http://app.f-union.com"

#import "SJTYBaseModel.h"

@interface BaseApiClient()

@end

@implementation BaseApiClient

static BaseApiClient *apiClient;


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.prodcutID=@"";
    }
    return self;
}


-(NSString *)prodcutID{
    if ([_prodcutID isEqualToString:@""]) {
        NSLog(@"===未设置ProductId,请设置产品ProductId");
    }
    return _prodcutID;
}

//POST请求
-(void)postRequest:(SJTYRequest *)request responseHandler:(ResponseHandler )responseHandler{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = request.timeoutInterval;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    NSString *cookieStr = [NSString stringWithFormat:@"JSESSIONID=%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"Cookie"]];
    if (cookieStr!=nil) {
        [manager.requestSerializer setValue:cookieStr forHTTPHeaderField:@"Cookie"];
    }
    
    NSString *url=[[NSString stringWithFormat:@"%@%@",Host,request.apiUrl] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    [manager POST:url parameters:request.params headers:@{} progress:^(NSProgress * _Nonnull uploadProgress) {
            
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        NSHTTPURLResponse *httpURLResponse = (NSHTTPURLResponse*)task.response;
        NSDictionary *dictTTTTTEMP = httpURLResponse.allHeaderFields;
        NSString *seesion=[[dictTTTTTEMP valueForKey:@"Cookie"] substringFromIndex:9];
        if (seesion!=nil) {
            [[NSUserDefaults standardUserDefaults] setValue:seesion forKey:@"Cookie"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
        
        NSError *error=nil;
        SJTYResponse *response= [SJTYResponse mj_objectWithKeyValues:responseObject];
        
        if (request.mapClass&&request.responseMapClass) {
            SJTYBaseModel *baseModel=[NSClassFromString(request.responseMapClass) mj_objectWithKeyValues:response.data];
            response.responseObj=baseModel;
            
        }
        
        responseHandler(error,response);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
        SJTYResponse *response= [[SJTYResponse alloc] init];
        response.status=error.code;
        response.message=[NSString stringWithFormat:@"网络错误(%ld)",(long)error.code];
        responseHandler(error,response);
    }];
}


-(void)getRequest:(SJTYRequest *)request responseHandler:(ResponseHandler )responseHandler{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = request.timeoutInterval;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    NSString *cookieStr = [NSString stringWithFormat:@"JSESSIONID=%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"Cookie"]];
    if (cookieStr!=nil) {
        [manager.requestSerializer setValue:cookieStr forHTTPHeaderField:@"Cookie"];
    }
    [manager GET:[NSString stringWithFormat:@"%@%@",Host,[request.apiUrl stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet  URLQueryAllowedCharacterSet]]] parameters:request.params headers:@{} progress:^(NSProgress * _Nonnull uploadProgress) {
            
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *error=nil;
        SJTYResponse *response= [SJTYResponse mj_objectWithKeyValues:responseObject];
        if (request.mapClass&&request.responseMapClass) {
            SJTYBaseModel *baseModel=[NSClassFromString(request.responseMapClass) mj_objectWithKeyValues:response.data];
            response.responseObj=baseModel;
            
        }
        
        if (!request.mapClass&&request.responseMapClass) {
            NSArray *dataArray=    [NSClassFromString(request.responseMapClass) mj_objectArrayWithKeyValuesArray:response.data];
            response.responseObj=dataArray;
        }
        
        responseHandler(error,response);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
        SJTYResponse *response= [[SJTYResponse alloc] init];
        response.status=error.code;
        response.message=[NSString stringWithFormat:@"网络错误(%ld)",(long)error.code];
        responseHandler(error,response);
    }];
}



-(void)putRequest:(SJTYRequest *)request responseHandler:(ResponseHandler )responseHandler{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = request.timeoutInterval;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    NSString *cookieStr = [NSString stringWithFormat:@"JSESSIONID=%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"Cookie"]];
    if (cookieStr!=nil) {
        [manager.requestSerializer setValue:cookieStr forHTTPHeaderField:@"Cookie"];
    }
    
    [manager PUT:[NSString stringWithFormat:@"%@%@",Host,[request.apiUrl stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet  URLQueryAllowedCharacterSet]]] parameters:request.params headers:@{} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *error=nil;
        SJTYResponse *response= [SJTYResponse mj_objectWithKeyValues:responseObject];
        if (request.mapClass&&request.responseMapClass) {
            SJTYBaseModel *baseModel=[NSClassFromString(request.responseMapClass) mj_objectWithKeyValues:response.data];
            response.responseObj=baseModel;
            
        }
        
        
        if (!request.mapClass&&request.responseMapClass) {
            NSArray *dataArray=    [NSClassFromString(request.responseMapClass) mj_objectArrayWithKeyValuesArray:response.data];
            response.responseObj=dataArray;
        }
        
        responseHandler(error,response);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        SJTYResponse *response= [[SJTYResponse alloc] init];
        response.status=error.code;
        response.message=[NSString stringWithFormat:@"网络错误(%ld)",(long)error.code];
        responseHandler(error,response);
    }];
    
}



-(void)postUploadFile:(SJTYRequest *)request progressHandler:(ProgressHandler)progressHandler responseHandler:(ResponseHandler )responseHandler{
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = request.timeoutInterval;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];


    manager.responseSerializer = [AFJSONResponseSerializer serializer];

    [manager.requestSerializer setValue:@"multipart/form-data" forHTTPHeaderField:@"Content-Type"];
    NSString *cookieStr = [NSString stringWithFormat:@"JSESSIONID=%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"Cookie"]];
    if (cookieStr!=nil) {
        [manager.requestSerializer setValue:cookieStr forHTTPHeaderField:@"Cookie"];
    }
    [manager POST:[NSString stringWithFormat:@"%@%@",Host,[request.apiUrl stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet  URLQueryAllowedCharacterSet]]] parameters:request.params headers:@{} constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSDate *date = [NSDate date];

        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];

        [formatter setDateFormat:@"yyyyMMddhhmmss"];

        NSString *dateNow = [formatter stringFromDate:date];

        NSString *imgFileId = @"file";

        for (int i = 0; i < request.fileArray.count; i++) {
            NSString *fileName = [NSString stringWithFormat:@"%@%@%d.png",imgFileId,dateNow,i];
            [formData appendPartWithFileData:request.fileArray[i] name:@"file" fileName:fileName mimeType:@"image/*"];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        progressHandler(uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *error=nil;
        SJTYResponse *response= [SJTYResponse mj_objectWithKeyValues:responseObject];
        responseHandler(error,response);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        SJTYResponse *response= [[SJTYResponse alloc] init];
        response.status=error.code;
        response.message=[NSString stringWithFormat:@"网络错误(%ld)",(long)error.code];
        responseHandler(error,response);
    }];
    
}

@end
