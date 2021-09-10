//
//  Define.h
//  Pods
//
//  Created by sjty on 2021/9/8.
//

#ifndef Define_h
#define Define_h

@class SJTYResponse;

typedef void(^ResponseHandler)(NSError * _Nullable error, SJTYResponse * _Nullable response);

typedef void(^ProgressHandler)(NSProgress * _Nonnull uploadProgress);

///主机地址
#define Host @"http://app.f-union.com"

///html 地址前缀
#define HOST_HTML [NSString stringWithFormat:@"%@/webHtml/html/",Host]
///文件 地址前缀
#define HOST_FILE [NSString stringWithFormat:@"%@/webFile/file/",Host]


typedef enum : NSUInteger {
    ///英文
    LANGUAGE_EN,
    ///中文
    LANGUAGE_CN,
    ///中国台湾
    LANGUAGE_CN_TW,
    ///日语
    LANGUAGE_JP,
} LANGUAGE;


#endif /* Define_h */
