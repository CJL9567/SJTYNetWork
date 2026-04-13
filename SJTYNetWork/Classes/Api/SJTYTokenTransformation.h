//
//  SJTYTokenTransformation.h
//  Pods
//
//  Created by sjty on 2026/4/13.
//

#import <Foundation/Foundation.h>


@class RainMakerToken;

@interface SJTYTokenTransformation : NSObject


+(NSString *)creatToenByTuya:(NSString *)uid nickName:(NSString *)nickName contactKey:(NSString *)contactKey portrait:(NSString *)portrait productId:(NSString *)productId;


+(NSString *)creatTokenByRainMaker:(RainMakerToken *)token;


+(RainMakerToken *)analiysisRainMakerToken:(NSString *)rainMakerToken productId:(NSString *)productId;


@end



@interface RainMakerToken : NSObject

@property(nonatomic,copy)NSString *username;

@property(nonatomic,copy)NSString *iss;

@property(nonatomic,copy)NSString *scope;

@property(nonatomic,copy)NSString *clientId;
@property(nonatomic,copy)NSString *provider;
@property(nonatomic,copy)NSString * productId;




@end

