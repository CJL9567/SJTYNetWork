//
//  KnowledgeApiClient.h
//  SJTYNetWork
//
//  Created by sjty on 2021/9/9.
//

#import "BaseApiClient.h"

NS_ASSUME_NONNULL_BEGIN

@interface KnowledgeApiClient : BaseApiClient


-(void)apiKnowledgeApiQueryType:(LANGUAGE)language responseHandler:(ResponseHandler _Nonnull)responseHandler;


-(void)apiKnowledgeApiQueryList:(NSString *)knowledgeId limit:(NSInteger)limit newData:(Boolean)newData responseHandler:(ResponseHandler _Nonnull)responseHandler;
 

@end

NS_ASSUME_NONNULL_END
