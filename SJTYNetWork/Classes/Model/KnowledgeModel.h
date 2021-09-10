//
//  KnowledgeModel.h
//  SJTYNetWork
//
//  Created by sjty on 2021/9/9.
//

#import "SJTYBaseModel.h"

NS_ASSUME_NONNULL_BEGIN


@class KnowledgeModel;
@interface KnowledgePageModel : SJTYBaseModel

@property(nonatomic,assign)NSInteger pages;

@property(assign,nonatomic)NSInteger current;

@property(assign,nonatomic)NSInteger size;

@property(nonatomic,strong)NSArray <KnowledgeModel *> *records;

@end


@class KnowledgeHtmlModel;
@interface KnowledgeModel : SJTYBaseModel

///创建时间
@property(nonatomic,copy)NSString *createTime;

///更新时间
@property(nonatomic,copy)NSString *updateTime;

///用户ID
@property(nonatomic,copy)NSString *userId;

///htmlId
@property(nonatomic,copy)NSString *htmlId;

///详情ID
@property(nonatomic,copy)NSString *distributorId;

///knowledgeId
@property(nonatomic,copy)NSString *knowledgeId;

///是否已推送
@property(assign,nonatomic)Boolean puted;

@property(nonatomic,strong)KnowledgeHtmlModel *htmlModel;

@end





@interface KnowledgeHtmlModel : SJTYBaseModel


///创建时间
@property(nonatomic,copy)NSString *createTime;

///更新时间
@property(nonatomic,copy)NSString *updateTime;

///用户ID
@property(nonatomic,copy)NSString *userId;

///标题
@property(nonatomic,copy)NSString *title;

///html内容摘要
@property(nonatomic,copy)NSString *htmlDesc;

/// 网页类型(用户协议1、隐私政策2、操作手册3、小贴士4、商品5)
@property(assign,nonatomic)NSInteger type1;

@property(assign,nonatomic)NSInteger type2;

@property(assign,nonatomic)NSInteger type3;

@property(assign,nonatomic)NSInteger prama1;

@property(assign,nonatomic)NSInteger prama2;

@property(assign,nonatomic)NSInteger prama3;

///图片路径
@property(nonatomic,copy)NSString *coverUrl;

///内容路径
@property(nonatomic,copy)NSString *contentUrl;


@property(nonatomic,copy)NSString *productId;


@property(assign,nonatomic)NSInteger contentFileType;


@property(nonatomic,copy)NSString *content;

///总查看数
@property(assign,nonatomic)NSInteger seeTotal;

///总点赞数
@property(assign,nonatomic)NSInteger topTotal;


@end




@interface KnowledgeTypeModel :SJTYBaseModel

@property(nonatomic,copy)NSString *knowledgeId;

///创建时间
@property(nonatomic,copy)NSString *createTime;

///更新时间
@property(nonatomic,copy)NSString *updateTime;

///产品ID
@property(nonatomic,copy)NSString *productId;

///语言
@property(assign,nonatomic)NSInteger langu;

///知识类别名
@property(nonatomic,copy)NSString *typeName;

///排序
@property(assign,nonatomic)NSInteger seq;

@end


NS_ASSUME_NONNULL_END
