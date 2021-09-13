//
//  SJTYRequest.h
//  SJTYNetWork
//
//  Created by sjty on 2021/9/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SJTYRequest : NSObject

///请求路径
@property(nonatomic,copy)NSString *apiUrl;

///请求参数
@property(nonatomic,strong)NSDictionary *params;

///请求超时时间，单位为秒
@property (nonatomic, assign) NSUInteger timeoutInterval;

///数据类型  集合类 or 单个对象 default NO
@property(nonatomic,assign)BOOL  mapClass;

///模型的类名
@property(nonatomic, copy )NSString  *responseMapClass;


///文件数组
@property(nonatomic,strong)NSArray <NSData *>*fileArray;


///文件下载保存的文件名
@property(nonatomic,copy)NSString *fileName;


@end

NS_ASSUME_NONNULL_END
