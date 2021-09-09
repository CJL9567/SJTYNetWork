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
