//
//  SJTYTokenTransformation.m
//  Pods
//
//  Created by sjty on 2026/4/13.
//

#import "SJTYTokenTransformation.h"
#import <JWT.h>
@implementation SJTYTokenTransformation

+(NSString *)creatToenByTuya:(NSString *)uid nickName:(NSString *)nickName contactKey:(NSString *)contactKey portrait:(NSString *)portrait productId:(NSString *)productId{
    
    NSString *secret = [NSString stringWithFormat:@"user_%@",[uid substringWithRange:NSMakeRange(0, 9)]];
    NSString *issOther = [NSString stringWithFormat:@"https://app-support.tuyacn.com/%@",secret];
    
    
    NSDictionary *payload = @{
        @"iss": @"Sjty-Client",
        @"sub": [[NSUUID UUID] UUIDString],
        @"nikeName": nickName,
        @"scope": @"tuya.APP",
        @"productId": productId,
        @"issOther": issOther,
        @"provider": @"TUYA",
        @"username": uid,
        @"contactKey": contactKey,
        @"portrait": portrait,
        @"exp": @([[NSDate date] timeIntervalSince1970]+3600*24*30),
        @"iat": @([[NSDate date] timeIntervalSince1970]),
    };
    
    NSString *algorithmName = @"HS256";
    
    // 3. 使用 JWTBuilder 进行编码
    JWTBuilder *builder = [JWTBuilder encodePayload:payload];
    builder.secret(secret);
    builder.algorithmName(algorithmName);
    // 4. 获取最终的 JWT 字符串
    NSString *jwtString = builder.encode;
    
    
    return jwtString;
}



+(NSString *)creatToKenByRainMaker:(RainMakerToken *)token{
    
    NSRange lastSlashRange = [token.iss rangeOfString:@"/" options:NSBackwardsSearch];
    
    if (lastSlashRange.location != NSNotFound) {
        NSInteger lastPosition = lastSlashRange.location; // 返回从 0 开始的下标
        NSLog(@"/ 最后出现的位置: %ld", (long)lastPosition);
    } else {
        NSLog(@"未找到 '/'");
    }
    NSString *secret =[token.iss substringToIndex:lastSlashRange.location+1];
    
    NSDictionary *payload = @{
        @"iss": @"Sjty-Client",
        @"sub": [[NSUUID UUID] UUIDString],
        @"scope": token.scope,
        @"productId": token.productId,
        @"issOther": token.iss,
        @"provider": [NSString stringWithFormat:@"AWS-RAINMAKER-%@",secret],
        @"username": token.username,
        @"exp": @([[NSDate date] timeIntervalSince1970]+3600*24*30),
        @"iat": @([[NSDate date] timeIntervalSince1970]),
    };
    
    NSString *algorithmName = @"HS256";
    
    // 3. 使用 JWTBuilder 进行编码
    JWTBuilder *builder = [JWTBuilder encodePayload:payload];
    builder.secret(secret);
    builder.algorithmName(algorithmName);
    // 4. 获取最终的 JWT 字符串
    NSString *jwtString = builder.encode;
    
    
    return jwtString;
    
}



+(RainMakerToken *)analiysisRainMakerToken:(NSString *)rainMakerToken productId:(NSString *)productId{
    NSArray *parts = [rainMakerToken componentsSeparatedByString:@"."];
    if (parts.count < 2) return nil;
    
    // 取 payload 部分（索引为1）
    NSString *payloadBase64Url = parts[1];
    
    // 转换为标准 Base64
    NSString *base64 = [payloadBase64Url stringByReplacingOccurrencesOfString:@"-" withString:@"+"];
    base64 = [base64 stringByReplacingOccurrencesOfString:@"_" withString:@"/"];
    // 补足填充位
    NSInteger mod = base64.length % 4;
    if (mod != 0) {
        base64 = [base64 stringByPaddingToLength:base64.length + (4 - mod) withString:@"=" startingAtIndex:0];
    }
    
    // Base64 解码
    NSData *jsonData = [[NSData alloc] initWithBase64EncodedString:base64 options:0];
    if (!jsonData) return nil;
    
    // JSON 解析
    NSError *error = nil;
    NSDictionary *payload = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    if (error) {
        NSLog(@"JSON 解析失败: %@", error);
        return nil;
    }
    
    
    NSString *issuer = [payload valueForKey:@"iss"];
    NSString *scope = [payload valueForKey:@"scope"];
    NSString *username = [payload valueForKey:@"username"];
    
    NSString *clientId = [payload valueForKey:@"client_id"];
    
    
    RainMakerToken *token = [[RainMakerToken alloc] init];
    token.iss=issuer;
    token.scope=scope;
    token.username=username;
    token.clientId=clientId;
    token.productId=productId;
    
    return token;
}


@end



@implementation RainMakerToken





@end
