//
//  FeedbackModel.h
//  SJTYNetWork
//
//  Created by sjty on 2021/9/10.
//

#import "SJTYBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FeedbackModel : SJTYBaseModel
///意见反馈Id
@property(nonatomic,copy)NSString *feedbackId;

///创建时间
@property(nonatomic,copy)NSString *createTime;

///更新时间
@property(nonatomic,copy)NSString *updateTime;

///意见反馈内容
@property(nonatomic,copy)NSString *context;

///意见反馈回复内容
@property(nonatomic,copy)NSString *processing;

///联系方式
@property(nonatomic,copy)NSString *contacts;
@end

NS_ASSUME_NONNULL_END
