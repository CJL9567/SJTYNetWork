//
//  SJTYSeessionUtil.m
//  SanlyLight
//
//  Created by sjty on 2026/4/13.
//  Copyright © 2026 深圳市四聚通用科技有限公司. All rights reserved.
//

#import "SJTYSeessionUtil.h"

@implementation SJTYSeessionUtil

+ (void)saveSession:(NSString *)session{
    [[NSUserDefaults standardUserDefaults] setObject:session forKey:sp_key_session];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+ (void)saveToken:(NSString *)token{
    [[NSUserDefaults standardUserDefaults] setObject:token forKey:sp_key_token];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+ (void)remove{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:sp_key_session];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:sp_key_token];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)getSession{
    return [[NSUserDefaults standardUserDefaults] objectForKey:sp_key_session];
}

+ (NSString *)getToken{
    if ([[NSUserDefaults standardUserDefaults] objectForKey:sp_key_token] ==nil) {
        return nil;
    }
    NSString *token= [NSString stringWithFormat:@"%@%@",TOKEN_PREFIX,[[NSUserDefaults standardUserDefaults] objectForKey:sp_key_token]];
    return token;
}

@end
