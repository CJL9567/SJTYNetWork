//
//  SJTYJWT.h
//  Pods
//
//  Created by sjty on 2026/5/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SJTYJWT : NSObject
+ (NSString *)jwtHS256WithPayload:(NSDictionary *)payload secret:(NSString *)secret;

@end

NS_ASSUME_NONNULL_END
