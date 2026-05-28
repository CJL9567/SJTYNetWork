//
//  SJTYJWT.m
//  Pods
//
//  Created by sjty on 2026/5/28.
//

#import "SJTYJWT.h"
#import <CommonCrypto/CommonHMAC.h>

@implementation SJTYJWT


+ (NSString *)jwtHS256WithPayload:(NSDictionary *)payload secret:(NSString *)secret{
    NSDictionary *header = @{
        @"typ": @"JWT",
        @"alg": @"HS256"
        
    };
    
    NSString *headerBase64 = [self base64UrlEncodeJSON:header];
    NSString *payloadBase64 = [self base64UrlEncodeJSON:payload];
    
    NSString *signingInput = [NSString stringWithFormat:@"%@.%@", headerBase64, payloadBase64];
    NSString *signature = [self hmacSHA256:signingInput secret:secret];
    
    return [NSString stringWithFormat:@"%@.%@", signingInput, signature];
}

+ (NSString *)base64UrlEncodeJSON:(NSDictionary *)dict {
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict
                                                       options:0
                                                         error:nil];
    NSString *base64 = [jsonData base64EncodedStringWithOptions:0];
    return [self base64UrlFromBase64:base64];
}

+ (NSString *)hmacSHA256:(NSString *)data secret:(NSString *)secret {
    NSData *keyData = [secret dataUsingEncoding:NSUTF8StringEncoding];
    NSData *dataToSign = [data dataUsingEncoding:NSUTF8StringEncoding];
    
    unsigned char digest[CC_SHA256_DIGEST_LENGTH];
    
    CCHmac(kCCHmacAlgSHA256,
           keyData.bytes,
           keyData.length,
           dataToSign.bytes,
           dataToSign.length,
           digest);
    
    NSData *signatureData = [NSData dataWithBytes:digest length:CC_SHA256_DIGEST_LENGTH];
    NSString *base64 = [signatureData base64EncodedStringWithOptions:0];
    return [self base64UrlFromBase64:base64];
}

+ (NSString *)base64UrlFromBase64:(NSString *)base64 {
    NSString *result = [base64 stringByReplacingOccurrencesOfString:@"+" withString:@"-"];
    result = [result stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    result = [result stringByReplacingOccurrencesOfString:@"=" withString:@""];
    return result;
}


@end
