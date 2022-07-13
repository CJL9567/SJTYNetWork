//
//  BaseApiClient.h
//  SJTYNetWork
//
//  Created by sjty on 2021/9/8.
//

#import <Foundation/Foundation.h>

#import "Define.h"
#import "SJTYRequest.h"
#import "SJTYResponse.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseApiClient : NSObject
///项目产品ID
@property(nonatomic,copy)NSString *prodcutID;

@property(nonatomic,copy)NSString *host;

-(void)postRequest:(SJTYRequest *)request responseHandler:(ResponseHandler )responseHandler;

-(void)getRequest:(SJTYRequest *)request responseHandler:(ResponseHandler )responseHandler;

-(void)putRequest:(SJTYRequest *)request responseHandler:(ResponseHandler )responseHandler;

-(void)postUploadFile:(SJTYRequest *)request progressHandler:(ProgressHandler)progressHandler responseHandler:(ResponseHandler )responseHandler;

-(void)downloadFile:(SJTYRequest *)request progressHandler:(ProgressHandler)progressHandler responseHandler:(ResponseHandler )responseHandler;


@end

NS_ASSUME_NONNULL_END
