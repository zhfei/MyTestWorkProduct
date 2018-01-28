//
//  MapViewController.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/3/29.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "MapViewController.h"
#import <BaiduMapAPI_Map/BMKMapView.h>
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <BaiduMapAPI_Location/BMKLocationComponent.h>

@interface MapViewController ()<BMKMapViewDelegate,BMKLocationServiceDelegate>

@property (strong,nonatomic)BMKMapView* mapView;
@property (strong,nonatomic)BMKLocationService* locService;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"地图";
    BMKMapView *mapView = [[BMKMapView alloc]init];
    [self.view  addSubview:mapView];
    self.mapView=mapView;
    
    [mapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(100, 0, 0, 0));
    }];
    
    
    self.locService = [[BMKLocationService alloc]init];
    [self customLocationAccuracyCircle];
    
    [_locService startUserLocationService];
//    _mapView.showsUserLocation = NO;//先关闭显示的定位图层
//    _mapView.userTrackingMode = BMKUserTrackingModeNone;//设置定位的状态
//    _mapView.showsUserLocation = YES;//显示定位图层
    
    NSArray *segmentedArray = [[NSArray alloc]initWithObjects:@"基本定位",@"定位罗盘",@"定位跟踪",@"定位关闭",nil];
    //初始化UISegmentedControl
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedArray];

    // 设置默认选择项索引
    segmentedControl.selectedSegmentIndex = 0;
    segmentedControl.tintColor = [UIColor redColor];
    // 有基本四种样式

    [self.view addSubview:segmentedControl];
    [segmentedControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(300);
        make.top.mas_equalTo(70);
    }];
    [segmentedControl addTarget:self action:@selector(modeChanged:) forControlEvents:UIControlEventValueChanged];

}

-(void)viewWillAppear:(BOOL)animated
{
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
}
-(void)viewWillDisappear:(BOOL)animated
{
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)modeChanged:(UISegmentedControl*)segmentControl
{
    switch (segmentControl.selectedSegmentIndex) {
        case 0:
        {
            _mapView.showsUserLocation = NO;//先关闭显示的定位图层
            _mapView.userTrackingMode = BMKUserTrackingModeNone;//设置定位的状态
            _mapView.showsUserLocation = YES;//显示定位图层
        }
            break;
        case 1:
        {
            _mapView.showsUserLocation = NO;
            _mapView.userTrackingMode = BMKUserTrackingModeFollowWithHeading;
            _mapView.showsUserLocation = YES;
        }
            break;
        case 2:
        {
            _mapView.showsUserLocation = NO;
            _mapView.userTrackingMode = BMKUserTrackingModeFollow;
            _mapView.showsUserLocation = YES;
        }
            break;
        case 3:
        {
            [_locService stopUserLocationService];
            _mapView.showsUserLocation = NO;
        }
            break;
            
        default:
            break;
    }
}

//自定义精度圈
- (void)customLocationAccuracyCircle {
    BMKLocationViewDisplayParam *param = [[BMKLocationViewDisplayParam alloc] init];
    param.accuracyCircleStrokeColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.5];
    param.accuracyCircleFillColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:0.3];
    [_mapView updateLocationViewWithParam:param];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


/**
 *在地图View将要启动定位时，会调用此函数
 *@param mapView 地图View
 */
- (void)willStartLocatingUser
{
    NSLog(@"start locate");
}

/**
 *用户方向更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    [_mapView updateLocationData:userLocation];
    NSLog(@"heading is %@",userLocation.heading);
}

/**
 *用户位置更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    //    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    [_mapView updateLocationData:userLocation];
}

/**
 *在地图View停止定位后，会调用此函数
 *@param mapView 地图View
 */
- (void)didStopLocatingUser
{
    NSLog(@"stop locate");
}

/**
 *定位失败后，会调用此函数
 *@param mapView 地图View
 *@param error 错误号，参考CLError.h中定义的错误号
 */
- (void)didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"location error");
}


- (void)dealloc {
    if (_mapView) {
        _mapView = nil;
    }
}


@end
