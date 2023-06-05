//
//  AdDataModel.h
//  SJTYNetWork
//
//  Created by sjty on 2021/9/9.
//

#import "SJTYBaseModel.h"

NS_ASSUME_NONNULL_BEGIN


@class AdDataModel;
@interface AdPageModel : SJTYBaseModel

@property(nonatomic,assign)NSInteger pages;

@property(assign,nonatomic)NSInteger current;

@property(assign,nonatomic)NSInteger size;

@property(nonatomic,strong)NSArray <AdDataModel *> *records;

@end

@class AdHtmlModel;
@interface AdDataModel : SJTYBaseModel
@property(nonatomic,copy)NSString *adDataId;
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

///广告类型（0启动页，1通知，2应用内,3推送）
@property(assign,nonatomic)NSInteger type;

///是否已推送
@property(assign,nonatomic)Boolean puted;

///推送产品ID
@property(nonatomic,copy)NSString *putProductId;

///Html详情
@property(nonatomic,strong)AdHtmlModel *htmlModel;

@end



@interface AdHtmlModel : SJTYBaseModel

///htmlId
@property(nonatomic,copy)NSString *htmlId;

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

@end





NS_ASSUME_NONNULL_END
