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


@property(nonatomic,strong)ClientUserInfoModel *clientUserInfo;
@end



@interface  ClientUserInfoModel : SJTYBaseModel

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



@end



NS_ASSUME_NONNULL_END
