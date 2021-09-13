//
//  NetWorkManager.h
//  SJTYNetWork
//
//  Created by sjty on 2021/9/8.
//

#import <Foundation/Foundation.h>

#import "UserApiClient.h"
#import "AdApiClient.h"
#import "HtmlApiClient.h"
#import "KnowledgeApiClient.h"
#import "LikeApiClient.h"
#import "CommunityApiClient.h"
#import "FeedbackApiClient.h"


typedef NS_ENUM(NSInteger, NetworkReachabilityStatus) {
    NetworkReachabilityStatusUnknown          = -1,
    NetworkReachabilityStatusNotReachable     = 0,
    NetworkReachabilityStatusReachableViaWWAN = 1,
    NetworkReachabilityStatusReachableViaWiFi = 2,
};

NS_ASSUME_NONNULL_BEGIN

@class ClientUserModel;
@interface NetWorkManager : NSObject

///用户Api
@property(nonatomic,strong,readonly)UserApiClient *userApiClient;

///广告Api
@property(nonatomic,strong,readonly)AdApiClient *adApiClient;

///网页相关Api
@property(nonatomic,strong,readonly)HtmlApiClient *htmlApiClient;

///意见反馈Api
@property(nonatomic,strong,readonly)FeedbackApiClient *feedBackApiClient;

///小贴士Api
@property(nonatomic,strong,readonly)KnowledgeApiClient *knowledgeApiClient;

///点赞Api
@property(nonatomic,strong,readonly)LikeApiClient *likeApiClient;

///社群Api
@property(nonatomic,strong,readonly)CommunityApiClient *communityApiClient;

///用户
@property(nonatomic,strong)ClientUserModel *clientUser;


+(instancetype)sharedInstance;

-(void)setHost:(NSString *)host;

-(void)setUpWithKey:(NSString *)key;


- (void)setReachabilityStatusChangeBlock:(nullable void (^)(NetworkReachabilityStatus status))block;


@end





NS_ASSUME_NONNULL_END
