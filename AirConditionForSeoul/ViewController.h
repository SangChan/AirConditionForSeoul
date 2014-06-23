//
//  ViewController.h
//  AirConditionForSeoul
//
//  Created by 이상찬 on 2014. 6. 13..
//  Copyright (c) 2014년 hconnect. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *btnLocation;
@property (weak, nonatomic) IBOutlet UIButton *btnSetting;
@property (weak, nonatomic) IBOutlet UIButton *btnRefresh;
@property (weak, nonatomic) IBOutlet UILabel *lblAirCondition;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end
