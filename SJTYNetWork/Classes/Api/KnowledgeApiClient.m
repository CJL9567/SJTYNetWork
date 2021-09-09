//
//  KnowledgeApiClient.m
//  SJTYNetWork
//
//  Created by sjty on 2021/9/9.
//

#import "KnowledgeApiClient.h"

@implementation KnowledgeApiClient

-(void)apiKnowledgeApiQueryType:(LANGUAGE)language responseHandler:(ResponseHandler _Nonnull)responseHandler{
    NSString *lang=@"en-US";
    if (language==LANGUAGE_EN) {
        lang=@"en-US";
    }else if (language==LANGUAGE_CN){
        lang=@"zh-CN";
    }else if (language==LANGUAGE_CN_TW){
        lang=@"zh-TW";
    }else if (language==LANGUAGE_JP){
        lang=@"ja-JP";
    }
    SJTYRequest *request=[[SJTYRequest alloc] init];
    request.apiUrl=[NSString stringWithFormat:@"/sjtyApi/app/tips/getTipsTypes?productId=%@&languStr=%@",self.prodcutID,lang];
    
    request.responseMapClass=@"KnowledgeTypeModel";
    [self getRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
    
}


-(void)apiKnowledgeApiQueryList:(NSString *)knowledgeId limit:(NSInteger)limit newData:(Boolean)newData responseHandler:(ResponseHandler _Nonnull)responseHandler{
    
    SJTYRequest *request=[[SJTYRequest alloc] init];
    request.apiUrl=[NSString stringWithFormat:@"/sjtyApi/app/tips/getTipsList?productId=%@&tipsTypeId=%@&limit=%ld&newOrOld=%d&needSeeAndTop=1",self.prodcutID,knowledgeId,limit,newData];
    request.mapClass=YES;
    request.responseMapClass=@"KnowledgePageModel";
    [self getRequest:request responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        responseHandler(error,response);
    }];
    
}

@end
