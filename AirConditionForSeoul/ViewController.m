//
//  ViewController.m
//  AirConditionForSeoul
//
//  Created by 이상찬 on 2014. 6. 13..
//  Copyright (c) 2014년 hconnect. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking/AFNetworking.h>

#define GET_AIRCONDITION_URL @"http://openapi.seoul.go.kr:8088/635043656373616e35385a4a455243/json/TimeAverageAirQuality/1/25/20140612"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self getAirCondition];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getAirCondition
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:GET_AIRCONDITION_URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", [responseObject class]);
        //NSString *jsonString = [NSString stringWithUTF8String:responseObject];
        //NSDictionary *data = [[JSONDecoder decoder]objectFromJSONString];
        //NSLog(@"Paresed JSON = %@", data);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}


@end
