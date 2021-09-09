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
    
    
    UserApiClient *apiClient=[[UserApiClient alloc] init];
    apiClient.prodcutID=@"1390916258916339713";
    [apiClient apiCode:@"1350027967@qq.com" simulation:true responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
            
        }];
}

@end

