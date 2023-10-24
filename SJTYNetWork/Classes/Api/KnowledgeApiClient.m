//
//  KnowledgeApiClient.m
//  SJTYNetWork
//
//  Created by sjty on 2021/9/9.
//

#import "KnowledgeApiClient.h"

@implementation KnowledgeApiClient


/// 小知识类型
/// @param language 语言类型
/// @param responseHandler 回调
-(void)apiKnowledgeApiQueryType:(NSString *)language responseHandler:(ResponseHandler _Nonnull)responseHandler{
    NSString *lang=@"en-US";
    if(language!=nil&&![language isEqualToString:@""]){
        lang=language;
    }
    SJTYRequest *request=[[SJTYRequest alloc] init];
    request.apiUrl=[NSString stringWithFormat:@"/sjtyApi/app/tips/getTipsTypes?productId=%@&languStr=%@",self.prodcutID,lang];
    
    request.responseMapClass=@"KnowledgeTypeModel";
    [self getRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
    
}

/// 小知识列表
/// @param knowledgeId 小知识分类ID
/// @param limit limit
/// @param newData 是否为新数据
/// @param responseHandler 回调
-(void)apiKnowledgeApiQueryList:(NSString *)knowledgeId limit:(NSInteger)limit newData:(Boolean)newData responseHandler:(ResponseHandler _Nonnull)responseHandler{
    
    SJTYRequest *request=[[SJTYRequest alloc] init];
    request.apiUrl=[NSString stringWithFormat:@"/sjtyApi/app/tips/getTipsList?productId=%@&tipsTypeId=%@&limit=%ld&newOrOld=%d&needSeeAndTop=1",self.prodcutID,knowledgeId,(long)limit,newData];
    request.mapClass=YES;
    request.responseMapClass=@"KnowledgePageModel";
    [self getRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
    
}

@end
