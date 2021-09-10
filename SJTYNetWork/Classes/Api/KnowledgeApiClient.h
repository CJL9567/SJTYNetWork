//
//  KnowledgeApiClient.h
//  SJTYNetWork
//
//  Created by sjty on 2021/9/9.
//

#import "BaseApiClient.h"

NS_ASSUME_NONNULL_BEGIN

@interface KnowledgeApiClient : BaseApiClient


/// 小知识类型
/// @param language 语言类型
/// @param responseHandler 回调
-(void)apiKnowledgeApiQueryType:(LANGUAGE)language responseHandler:(ResponseHandler _Nonnull)responseHandler;


/// 小知识列表
/// @param knowledgeId 小知识分类ID
/// @param limit limit
/// @param newData 是否为新数据
/// @param responseHandler 回调
-(void)apiKnowledgeApiQueryList:(NSString *)knowledgeId limit:(NSInteger)limit newData:(Boolean)newData responseHandler:(ResponseHandler _Nonnull)responseHandler;
 

@end

NS_ASSUME_NONNULL_END
