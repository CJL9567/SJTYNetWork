//
//  CommunityModel.h
//  SJTYNetWork
//
//  Created by sjty on 2021/9/10.
//

#import "SJTYBaseModel.h"

NS_ASSUME_NONNULL_BEGIN


@class CommunityModel;
@interface CommunityPageModel : SJTYBaseModel

@property(nonatomic,assign)NSInteger pages;

@property(assign,nonatomic)NSInteger current;

@property(assign,nonatomic)NSInteger size;

@property(nonatomic,strong)NSArray <CommunityModel *> *records;

@end

@interface CommunityModel : SJTYBaseModel

///关联Id
@property(nonatomic,copy)NSString *communityId;


///创建时间
@property(nonatomic,copy)NSString *createTime;

///更新时间
@property(nonatomic,copy)NSString *updateTime;

///评论内容
@property(nonatomic,copy)NSString *content;

///图片地址
@property(nonatomic,copy)NSString *picUrl;

///状态
@property(assign,nonatomic)NSInteger status;

///备注
@property(nonatomic,copy)NSString *remark;

///
@property(assign,nonatomic)NSInteger flowNum;

@end



NS_ASSUME_NONNULL_END
