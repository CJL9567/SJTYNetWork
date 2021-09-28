//
//  ClientUserModel.h
//  SJTYNetWork
//
//  Created by sjty on 2021/9/9.
//

#import "SJTYBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@class ClientUserInfoModel;
@interface ClientUserModel : SJTYBaseModel
///用户Id
@property(nonatomic,strong)NSString *userId;

///个性签名
@property(nonatomic,copy)NSString *autograph;

///邮箱
@property(nonatomic,copy)NSString *email;

///密码
@property(nonatomic,copy)NSString *password;

///电话号码
@property(nonatomic,copy)NSString *phone;

///头像
@property(nonatomic,copy)NSString *portrait;

///产品ID
@property(nonatomic,copy)NSString *productId;

///性别（0为男，1为女,2未知）
@property(assign,nonatomic)NSInteger sex;

///三方登录key
@property(nonatomic,copy)NSString *tripartiteLoginKey;

///三方登录类型（Facebook、Wechat等）
@property(nonatomic,copy)NSString *tripartiteLoginType;


@property(nonatomic,copy)NSString *updateTime;


///用户名（默认值顺序：设置值、邮箱、电话）
@property(nonatomic,copy)NSString *username;

///颜值
@property(nonatomic,copy)NSString *salt;


@property(nonatomic,strong)ClientUserInfoModel *clientUserInfo;
@end



@interface  ClientUserInfoModel : SJTYBaseModel

///用户Id
@property(nonatomic,strong)NSString *userId;

///地址（市）
@property(nonatomic,copy)NSString *address;

///年龄
@property(assign,nonatomic)NSInteger age;

///生日
@property(nonatomic,copy)NSString *birthday;

///国家
@property(nonatomic,copy)NSString *country;

///姓
@property(nonatomic,copy)NSString *firstName;

///名字
@property(nonatomic,copy)NSString *lastName;

///身高
@property(assign,nonatomic)NSInteger height;

///体重
@property(assign,nonatomic)NSInteger weight;


///纬度
@property(assign,nonatomic)double lat;

///经度
@property(assign,nonatomic)double lng;

///名称
@property(nonatomic,copy)NSString *name;

///产品ID
@property(nonatomic,copy)NSString *productId;

///备注
@property(nonatomic,copy)NSString *remark;

///紧急联系人
@property(nonatomic,copy)NSString  *emergencyContact;

///紧急联系人id
@property(nonatomic,copy)NSString *emergencyContactId;

///紧急联系人电话
@property(nonatomic,copy)NSString *emergencyContactPhone;

///扩展字段(根据各个项目决定，后续可扩展为es)
@property(nonatomic,copy)NSString *extJson;

///扩展字段1
@property(nonatomic,copy)NSString *param1;

///扩展字段2
@property(nonatomic,copy)NSString *param2;

///扩展字段3
@property(nonatomic,copy)NSString *param3;

///扩展字段4
@property(nonatomic,copy)NSString *param4;


@end



NS_ASSUME_NONNULL_END
