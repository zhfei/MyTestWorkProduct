//
//  MapViewController.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/7/5.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "FZMapViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface FZMapViewController() <CLLocationManagerDelegate>
{
    CLLocationManager *_locationManager;
}
@end

@implementation FZMapViewController
- (void)viewDidLoad
{
    [super viewDidLoad];

    _locationManager=[[CLLocationManager alloc]init];
    
    if (![CLLocationManager locationServicesEnabled]) {
    }
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{

}

@end
