//
//  KnowledgeModel.m
//  SJTYNetWork
//
//  Created by sjty on 2021/9/9.
//

#import "KnowledgeModel.h"



@implementation KnowledgePageModel

+ (NSDictionary *)mj_objectClassInArray{
    return @{ @"records" : [KnowledgeModel class]};
}

@end

@implementation KnowledgeModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"knowledgeId":@"tipsTypeId",
             @"htmlModel":@"html"
    };
}


@end



@implementation KnowledgeHtmlModel



@end


@implementation KnowledgeTypeModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"knowledgeId":@"id"};
}




@end
