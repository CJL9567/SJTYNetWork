//
//  OTAModel.h
//  SJTYNetWork
//
//  Created by sjty on 2022/7/12.
//

#import "SJTYBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    ///所有不提醒
    OTAALERTNONE=0x00,
    ///全部提醒
    OTAALERTALL=0x01,
    ///蓝牙提醒
    OTAALERTBLUETOOTH=0x02,
    ///WIFI提醒
    OTAALERTWIFI=0x03,
} OTAALERT;

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

///固件提醒类型
@property(assign,nonatomic)OTAALERT otaAlert;

@end

NS_ASSUME_NONNULL_END
