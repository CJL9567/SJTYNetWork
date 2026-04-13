//
//  SJTYSeessionUtil.h
//  SanlyLight
//
//  Created by sjty on 2026/4/13.
//  Copyright © 2026 深圳市四聚通用科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


#define sp_key_session @"Cookie"
#define sp_key_token @"TOKEN"

#define TOKEN_HEADER_KEY @"Authorization"
#define TOKEN_PREFIX @"Bearer "

@interface SJTYSeessionUtil : NSObject


+ (void)saveSession:(NSString *)session;
+ (void)saveToken:(NSString *)token;
+ (void)remove;

+ (NSString *)getSession;
+ (NSString *)getToken;





@end

NS_ASSUME_NONNULL_END
