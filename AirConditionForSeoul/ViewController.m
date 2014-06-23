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

@interface ViewController () {
    NSArray *arrayOfAirConditions;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    arrayOfAirConditions = [NSArray arrayWithObjects:@"이산화질소: %@ppm",@"오존: %@ppm",@"일산화탄소: %@ppm",@"아황산가스: %@ppm",@"미세먼지: %@㎍/㎥",@"초미세먼지: %@㎍/㎥",nil];
    //{,@"",@"",@"",@""};
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    
    // Setting the swipe direction.
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    
    // Adding the swipe gesture on image view
    [_lblAirCondition addGestureRecognizer:swipeLeft];
    [_lblAirCondition addGestureRecognizer:swipeRight];
    
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
        //NSLog(@"JSON: %@", [responseObject class]);
        //NSString *jsonString = [NSString stringWithUTF8String:responseObject];
        //NSDictionary *data = [[JSONDecoder decoder]objectFromJSONString];
        NSLog(@"Paresed JSON = %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}

- (void)handleSwipe:(UISwipeGestureRecognizer *)swipe {
    int currentPage = [_pageControl currentPage];
    int willChangePage;
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"+1");
        willChangePage = currentPage+1;
        if (willChangePage < [_pageControl numberOfPages]) {
            [_pageControl setCurrentPage:willChangePage];
            [_lblAirCondition setText:[arrayOfAirConditions objectAtIndex:[_pageControl currentPage]]];
        }
    }
    else if (swipe.direction == UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"-1");
        willChangePage = currentPage-1;
        if (willChangePage >= 0) {
            [_pageControl setCurrentPage:willChangePage];
            [_lblAirCondition setText:[arrayOfAirConditions objectAtIndex:[_pageControl currentPage]]];
        }
        
    }
    
}


@end
