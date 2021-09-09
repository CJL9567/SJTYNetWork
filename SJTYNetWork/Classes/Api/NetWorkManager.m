//
//  NetWorkManager.m
//  SJTYNetWork
//
//  Created by sjty on 2021/9/8.
//

#import "NetWorkManager.h"
#import <AFNetworking/AFNetworking.h>
#import <CoreTelephony/CTCellularData.h>


#import "Define.h"
#import "SJTYRequest.h"

@interface NetWorkManager()

@end

@implementation NetWorkManager
static NetWorkManager *manager;

+(instancetype)sharedInstance{
    static dispatch_once_t oneToken;
    
    dispatch_once(&oneToken, ^{
        manager = [[NetWorkManager alloc]init];
        [manager loadNetwork];
    });
    
    return manager;
}


-(void)loadNetwork{
    
    [self loadHtml];
    CTCellularData *cellularData = [[CTCellularData alloc]init];
    cellularData.cellularDataRestrictionDidUpdateNotifier = ^(CTCellularDataRestrictedState state) {
        //获取联网状态
        switch (state) {
            case kCTCellularDataRestricted:
                NSLog(@"禁止");
//                NSLog(@"");
                break;
            case kCTCellularDataNotRestricted:
                NSLog(@"同意");
                
                break;
            case kCTCellularDataRestrictedStateUnknown:
                
                break;
            default:
                break;
        };
    };
}

-(void)loadHtml{
    
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];

    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request];
    [dataTask resume];
    
}



-(void)userCheckSeesionHandler:(ResponseHandler )responseHandler{
    
    
    
}






@end
