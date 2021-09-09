//
//  SJTYRequest.m
//  SJTYNetWork
//
//  Created by sjty on 2021/9/8.
//

#import "SJTYRequest.h"

@implementation SJTYRequest

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.timeoutInterval =5;
        self.params=@{};
    }
    return self;
}

@end
