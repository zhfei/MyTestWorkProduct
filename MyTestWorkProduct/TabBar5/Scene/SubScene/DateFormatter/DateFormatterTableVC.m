//
//  DateFormatterTableVC.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/2/23.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "DateFormatterTableVC.h"
#import "SelectBoxAlertController.h"

static NSString * cellID =@"UITableViewCell";

@interface DateFormatterTableVC ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic)NSArray *dataSouce;

@end

@implementation DateFormatterTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"'公元前/后:'G  '年份:'u'='yyyy'='yy '季度:'q'='qqq'='qqqq '月份:'M'='MMM'='MMMM '今天是今年第几周:'w '今天是本月第几周:'W  '今天是今天第几天:'D '今天是本月第几天:'d '星期:'c'='ccc'='cccc '上午/下午:'a '小时:'h'='H '分钟:'m '秒:'s '毫秒:'SSS  '这一天已过多少毫秒:'A  '时区名称:'zzzz'='vvvv '时区编号:'Z "];
    NSLog(@"%@", [dateFormatter stringFromDate:[NSDate date]]);

//OutPut:

//1. 区域格式：美国
//
//
//公元前/后:AD  年份:2013=2013=13 季度:3=Q3=3rd quarter 月份:8=Aug=August 今天是今年第几周:32 今天是本月第几周:2  今天是今天第几天:219 今天是本月第几天:7 星期:4=Wed=Wednesday 上午/下午:AM 小时:1=1 分钟:24 秒:32 毫秒:463  这一天已过多少毫秒:5072463  时区名称:China Standard Time=China Standard Time 时区编号:+0800
//
//2. 区域格式：中国
//
//公元前/后:公元  年份:2013=2013=13 季度:3=三季度=第三季度 月份:8=8月=8月 今天是今年第几周:32 今天是本月第几周:2  今天是今天第几天:219 今天是本月第几天:7 星期:4=周三=星期三 上午/下午:上午 小时:1=1 分钟:44 秒:30 毫秒:360  这一天已过多少毫秒:6270360  时区名称:中国标准时间=中国标准时间 时区编号:+0800

    
    [self setDateWithDateFomtterString:@"yyyy-MM-dd a HH:mm:ss EEEE"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//fmt.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss";
//打印输出：2012-10-29T16:08:40

//fmt.dateFormat = @"yyyy-MM-dd a HH:mm:ss EEEE";
//打印输出：2012-10-29 下午 16:25:27 星期一

- (void)setDateWithDateFomtterString:(NSString *) dfString {

    NSString * defaultFomtter;
    if (!dfString) {
        defaultFomtter=@"yyyy-MM-dd HH:mm:ss";
    } else {
        defaultFomtter=dfString;
    }
    
    NSDateFormatter *format=[[NSDateFormatter alloc] init];
    [format setDateFormat:defaultFomtter];
    
    // 英文
    //[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    //这使用的系统提供的格式化字符串，通过 fmt.dateStyle 和 fmt.timeStyle 进行的设置。实例中使用的参数是 kCFDateFormatterShortStyle，此外还有：
    //typedef CF_ENUM(CFIndex, CFDateFormatterStyle) {    // date and time format styles
    //    kCFDateFormatterNoStyle = 0,       // 无输出
    //    kCFDateFormatterShortStyle = 1,    // 10/29/12, 2:27 PM
    //    kCFDateFormatterMediumStyle = 2,   // Oct 29, 2012, 2:36:59 PM
    //    kCFDateFormatterLongStyle = 3,     // October 29, 2012, 2:38:46 PM GMT+08:00
    //    kCFDateFormatterFullStyle = 4      // Monday, October 29, 2012, 2:39:56 PM China Standard Time
    //};
    
    // 中文
    //fmt.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    //则对应的输出为：
    //typedef CF_ENUM(CFIndex, CFDateFormatterStyle) {    // date and time format styles
    //    kCFDateFormatterNoStyle = 0,       // 无输出
    //    kCFDateFormatterShortStyle = 1,    // 12-10-29 下午2:52
    //    kCFDateFormatterMediumStyle = 2,   // 2012-10-29 下午2:51:43
    //    kCFDateFormatterLongStyle = 3,     // 2012年10月29日 GMT+0800下午2时51分08秒
    //    kCFDateFormatterFullStyle = 4      // 2012年10月29日星期一 中国标准时间下午2时46分49秒
    //};
    
    format.dateStyle = kCFDateFormatterFullStyle;
    format.timeStyle = kCFDateFormatterFullStyle;
    format.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    
    //时区问题，导致时间差了8小时
//    [format setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
//    [format setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    
    NSString *dateString = [format stringFromDate:[NSDate date]];
    
    NSLog(@"%@:----%@",NSStringFromSelector(_cmd),dateString);
    

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.textLabel.text=@"标题";
    
    return cell;
}


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIAlertController *alertVC= [SelectBoxAlertController alertViewController:@"hello"];
    
    [self presentViewController:alertVC animated:YES completion:nil];
    
}


@end
