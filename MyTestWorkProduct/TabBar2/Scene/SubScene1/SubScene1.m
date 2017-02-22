//
//  SubScene1.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 15/11/26.
//  Copyright © 2015年 zhoufei. All rights reserved.
//

#import "SubScene1.h"
#import "DBManager.h"
#import "Person.h"

@interface SubScene1 ()<UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate>
{
    NSArray  * _proTimeList;
    NSArray  * _proTitleList;
    
    NSString * _proNameStr;
    NSString * _proTimeStr;
}
- (IBAction)switchChanged:(UISwitch *)sender;
@property (weak, nonatomic) IBOutlet UISwitch *mySwitch;
@property (weak, nonatomic) IBOutlet UITextField *myTextField;

@property (strong,nonatomic)UIPickerView *pickerView;
@property (strong,nonatomic)NSMutableArray *myMutableArray;

@end

@implementation SubScene1
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title=[NSString stringWithFormat:@"第%lu层--第%lu个-",[self.navigationController.viewControllers count],self.index];
    
    UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectZero];
    // 显示选中框
    pickerView.showsSelectionIndicator=YES;
    pickerView.dataSource = self;
    pickerView.delegate = self;
    
    
    self.pickerView=pickerView;
    self.pickerView.layer.borderWidth=2;
    self.pickerView.layer.borderColor=[UIColor redColor].CGColor;
    
    [self.view addSubview:pickerView];
    
    [pickerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(pickerView.superview).with.offset(100);
        make.width.equalTo(pickerView.superview);
        make.height.mas_equalTo(@(100));
    }];
    //[pickerView setFrame:CGRectMake(0, 100, 200, 200)];
    
 
    _proTimeList = [[NSArray alloc]initWithObjects:@"layer1",@"layer2",@"layer3",@"layer4",@"layer5",@"layer6",@"layer7",@"layer8",@"layer9",@"layer10",nil];
    _proTitleList = [[NSArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",nil];
    

//    UITextField *textField =[[UITextField alloc]init];
//    textField.delegate=self;
//    textField.layer.borderColor=[UIColor lightGrayColor].CGColor;
//    textField.layer.borderWidth=2;
//    textField.layer.cornerRadius=2;
//    [self.view addSubview:textField];
//    
//    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(pickerView.mas_bottom).with.offset(20);
//        make.height.mas_equalTo(@(60));
//        make.width.equalTo(pickerView.mas_width);
//    }];
    
    
//    NSLock *lock = [[NSLock alloc] init];
//    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        
//        static void (^RecursiveMethod)(int);
//        
//        RecursiveMethod = ^(int value) {
//            
//            [lock lock];
//            if (value > 0) {
//                
//                NSLog(@"value = %d", value);
//                sleep(2);
//                RecursiveMethod(value - 1);
//            }
//            [lock unlock];
//        };
//        
//        RecursiveMethod(5);
//    });
    

    self.mySwitch.onImage=[UIImage imageNamed:@"button_blueline"];
    self.mySwitch.offImage=[UIImage imageNamed:@"BTScannerGun_Disconnect@2x"];

    NSArray *arr =[NSArray arrayWithObjects:@"aa",@"bb",@"cc",@"dd",@"ee", nil];
    NSArray *arr1 =[NSArray arrayWithObjects:@1,@1,@1,@1,@1,@1,@1,@1, nil];
    MyLog(@"arr:%@------%@-----%@",arr,[arr valueForKeyPath:@"uppercaseString"],[arr1 valueForKeyPath:@"@sum.self"]);
    
    NSArray *array = @[@"name", @"w", @"aa", @"jimsa", @"aa"];
    NSLog(@"%@", [array valueForKeyPath:@"@distinctUnionOfObjects.self"]);//
    
//    [textField setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
//    [textField setValue:[UIFont boldSystemFontOfSize:16] forKeyPath:@"_placeholderLabel.font"];
    
    [self.myTextField setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self.myTextField setValue:[UIFont boldSystemFontOfSize:16] forKeyPath:@"_placeholderLabel.font"];
    
    if(self.myMutableArray.count!=0){
     MyLog(@"file:%s----perform:%@---bundle:%@",__FILE__,NSStringFromSelector(_cmd),NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0]);
    }
   
   
}



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    MyLog(@"%@",NSStringFromCGRect(self.pickerView.frame));
//    
//    UIVisualEffectView *visualEffect = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight]];
//    
//    visualEffect.frame = CGRectMake(0, 190, self.view.bounds.size.width, 300);
//    visualEffect.backgroundColor=[UIColor blueColor];
//    
//    visualEffect.alpha = 0.9;
//    
//    [self.view addSubview:visualEffect];
    
    
    
}

// pickerView 列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

// pickerView 每列个数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return [_proTitleList count];
    }
    
    return [_proTimeList count];
}

// 每列宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    
//    if (component == 1) {
//        return 40;
//    }
    return 100;
}
// 返回选中的行
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        _proNameStr = [_proTitleList objectAtIndex:row];
    } else {
        _proTimeStr = [_proTimeList objectAtIndex:row];
    }
    
}

//返回当前行的内容,此处是将数组中数值添加到滚动的那个显示栏上
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return [_proTitleList objectAtIndex:row];
    } else {
        return [_proTimeList objectAtIndex:row];
        
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    MyLog(@"%@",textField.selectedTextRange);
    
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return YES;
}

- (IBAction)switchChanged:(UISwitch *)sender {

//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [sender setOn:!sender.on animated:YES];
//    });
    
    // 创建数据库和相关表: Insert all data
    [[DBManager sharedManager] initDB:^(BOOL success) {
        
        if (!success) {
            
            NSLog(@"ERR: 数据库第一次写入数据好像发生了某些错误");
            
        } else {
            
            NSLog(@"OOK: 数据库第一次写入数据成功");
            [HUDView showWithOnlyText:@"OOK: 数据库第一次写入数据成功"];
        }
    }];

    Person * pp =[[Person alloc]init];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [HUDView hideHUDForView:self.view animated:YES];
        
        
        for (int i=0; i<5; i++) {
            [pp setValue:[NSString stringWithFormat:@"name_%d",i] forKey:@"name"];
            sleep(2);
        }
        
        
    });
}
@end
