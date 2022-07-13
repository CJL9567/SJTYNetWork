//
//  OTAModel.h
//  SJTYNetWork
//
//  Created by sjty on 2022/7/12.
//

#import "SJTYBaseModel.h"

NS_ASSUME_NONNULL_BEGIN



@interface OTAModel : SJTYBaseModel

@property(nonatomic,copy)NSString *otaId;
/// 文件名
@property(nonatomic,copy)NSString *fileName;


/// 文件地址(不包含主机地址)
@property(nonatomic,copy)NSString *fileUrl;


/// 产品Id
@property(nonatomic,copy)NSString *productId;

/// 产品型号
@property(nonatomic,copy)NSString *productSub;

/// 版本号
@property(assign,nonatomic)NSInteger versionNo;


/// 版本名称
@property(nonatomic,copy)NSString *versionName;

/// 版本描述
@property(nonatomic,copy)NSString *versionDesc;

/// OTA IC 生产商
@property(nonatomic,copy)NSString *factory;

//OTA IC 型号
@property(nonatomic,copy)NSString *model;

///产品名
@property(nonatomic,copy)NSString *productName;


///创建时间
@property(nonatomic,copy)NSString *createTime;

///更新时间时间
@property(nonatomic,copy)NSString *updateTime;

@end

NS_ASSUME_NONNULL_END
