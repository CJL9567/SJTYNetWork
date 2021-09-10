//
//  CommunityModel.m
//  SJTYNetWork
//
//  Created by sjty on 2021/9/10.
//

#import "CommunityModel.h"

@implementation CommunityModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
             @"communityId":@"id",
             @"status":@"statue"
    };
}

@end


@implementation CommunityPageModel

+ (NSDictionary *)mj_objectClassInArray{
    return @{ @"records" : [CommunityModel class]};
}

@end
