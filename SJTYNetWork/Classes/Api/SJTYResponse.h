//
//  SJTYResponse.h
//  SJTYNetWork
//
//  Created by sjty on 2021/9/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SJTYResponse : NSObject

///回复数据
@property(nonatomic,strong)id data;

///信息
@property(nonatomic,copy)NSString *message;

///状态码
@property(assign,nonatomic)NSInteger status;


///返回结果数据  ---实际可用数据
@property(nonatomic,strong)id responseObj;


@end

NS_ASSUME_NONNULL_END
