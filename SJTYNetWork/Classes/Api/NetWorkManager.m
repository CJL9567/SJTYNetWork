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


typedef void (^NetworkReachabilityStatusBlock)(NetworkReachabilityStatus status);

@interface NetWorkManager()
@property(nonatomic,strong)AppApiClient *appApi;
@property(nonatomic,strong)UserApiClient *userApi;
@property(nonatomic,strong)AdApiClient *adApi;
@property(nonatomic,strong)HtmlApiClient *htmlApi;
@property(nonatomic,strong)FeedbackApiClient *feedBackApi;
@property(nonatomic,strong)KnowledgeApiClient *knowledgeApi;
@property(nonatomic,strong)LikeApiClient *likeApi;
@property(nonatomic,strong)CommunityApiClient *communityApi;

@property(nonatomic,strong)OTAApiClient *otaApi;
@property (readwrite, nonatomic, copy) NetworkReachabilityStatusBlock networkReachabilityStatusBlock;

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
    
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (self.networkReachabilityStatusBlock) {
            self.networkReachabilityStatusBlock((NetworkReachabilityStatus)status);
        }
        switch (status) {
                case AFNetworkReachabilityStatusUnknown:
                    NSLog(@"未识别的网络");
                    break;
                        
                case AFNetworkReachabilityStatusNotReachable:
                    NSLog(@"不可达的网络（未连接）");
                    break;
                        
                case AFNetworkReachabilityStatusReachableViaWiFi:
                    NSLog(@"WiFi网络");
                    break;
                        
                case AFNetworkReachabilityStatusReachableViaWWAN:
                    NSLog(@"移动网络");
                    break;
                        
                default:
                    break;
            }
    }];
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
}

-(void)setHost:(NSString *)host{
    self.userApi.host=host;
    self.adApi.host=host;
    self.htmlApi.host=host;
    self.feedBackApi.host=host;
    self.knowledgeApi.host=host;
    self.likeApi.host=host;
    self.communityApi.host=host;
    self.otaApi.host=host;
    self.appApi.host=host;
    
}

///初始化各个Api Client
-(void)setUpWithKey:(NSString *)key{
    
    self.userApi=[[UserApiClient alloc] init];
    self.userApi.prodcutID=key;
    
    self.adApi=[[AdApiClient alloc] init];
    self.adApi.prodcutID=key;
    
    self.htmlApi=[[HtmlApiClient alloc] init];
    self.htmlApi.prodcutID=key;
    
    self.feedBackApi=[[FeedbackApiClient alloc] init];
    self.feedBackApi.prodcutID=key;
    
    self.knowledgeApi=[[KnowledgeApiClient alloc] init];
    self.knowledgeApi.prodcutID=key;
    
    self.likeApi=[[LikeApiClient alloc] init];
    self.likeApi.prodcutID=key;
    
    self.communityApi=[[CommunityApiClient alloc] init];
    self.communityApi.prodcutID=key;
    
    
    self.appApi=[[AppApiClient alloc] init];
    self.appApi.prodcutID=key;
    
    self.otaApi=[[OTAApiClient alloc] init];
    self.otaApi.prodcutID=key;
    
    
    [self.appApi apiAppEnable:key responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        if (response.status==200) {
            NSNumber *enable=response.data;
            
            self.appEnableBlock([enable boolValue]);
        }
       
    }];
}


- (void)setReachabilityStatusChangeBlock:(nullable void (^)(NetworkReachabilityStatus status))block{
    self.networkReachabilityStatusBlock=block;
}




-(UserApiClient *)userApiClient{
    return self.userApi;
}


-(AdApiClient *)adApiClient{
    return self.adApi;
}

-(KnowledgeApiClient *)knowledgeApiClient{
    return self.knowledgeApi;
}

- (HtmlApiClient *)htmlApiClient{
    return self.htmlApi;
}

-(FeedbackApiClient *)feedBackApiClient{
    return self.feedBackApi;
}

- (LikeApiClient *)likeApiClient{
    return self.likeApi;
}

-(CommunityApiClient *)communityApiClient{
    return self.communityApi;
}


-(OTAApiClient *)otaApiClient{
    return self.otaApi;
}

-(AppApiClient *)appApiClient{
    return self.appApi;
}


@end
