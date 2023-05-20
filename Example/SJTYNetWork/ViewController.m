//
//  ViewController.m
//  SJTYNetWork
//
//  Created by sjty on 2023/5/20.
//  Copyright © 2023 caijialiang. All rights reserved.
//

#import "ViewController.h"
#import <SJTYNetwork.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    OTAApiClient *otaClient = [[OTAApiClient alloc] init];
    otaClient.prodcutID =@"1650324943902347265";
    [otaClient apiOTAApiQueryLastOTAWithProductSub:@"景观灯" queryPublish:false responseHandler:^(NSError * _Nullable error, SJTYResponse * _Nullable response) {
        if(response.status==200){
            
        }
    }];
}


@end
