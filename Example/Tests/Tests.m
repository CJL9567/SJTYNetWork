//
//  SJTYNetWorkTests.m
//  SJTYNetWorkTests
//
//  Created by caijialiang on 09/08/2021.
//  Copyright (c) 2021 caijialiang. All rights reserved.
//

@import XCTest;

#import <SJTYNetWork/NetWorkManager.h>
#import <SJTYNetWork/UserApiClient.h>
#import <SJTYNetWork/AppApiClient.h>
#import <SJTYNetWork/OTAApiClient.h>
@interface Tests : XCTestCase

@end

@implementation Tests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    OTAApiClient *otaClient = [[OTAApiClient alloc] init];
    otaClient.prodcutID =@"1650324943902347265";
    [otaClient apiOTAApiQueryListWithProductSub:@"景观灯" queryPublish:false responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        if(response.status==200){
            
        }
    }];
//    AppApiClient *apiClient=[[AppApiClient alloc] init];
//    apiClient.prodcutID=@"1523949849220091906";
//    [apiClient apiAppEnable:@"1" responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
//        NSLog(@"");
//    }];
//    [apiClient apiCode:@"1350027967@qq.com" simulation:true responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
//
//        }];
}

@end

