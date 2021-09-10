//
//  ClientUserModel.m
//  SJTYNetWork
//
//  Created by sjty on 2021/9/9.
//

#import "ClientUserModel.h"

@implementation ClientUserModel


+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"clientUserInfo":@"clientUserInfo",
             @"userId":@"id"
    };
}

@end


@implementation ClientUserInfoModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
             @"userId":@"id"
    };
}

@end
