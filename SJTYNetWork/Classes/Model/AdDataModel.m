//
//  AdDataModel.m
//  SJTYNetWork
//
//  Created by sjty on 2021/9/9.
//

#import "AdDataModel.h"

@implementation AdDataModel


+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"htmlModel":@"html"};
}

@end


@implementation AdHtmlModel



@end


@implementation AdPageModel

+ (NSDictionary *)mj_objectClassInArray{
    return @{ @"records" : [AdDataModel class]};
}

@end
