//
//  FontSettingsViewController.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/3/28.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "FontSettingsViewController.h"

static NSString *cellID =@"myCell";

@interface FontSettingsViewController ()
@property (strong,nonatomic)NSArray *dataSource;
@end

@implementation FontSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view..
    
    self.dataSource=@[@"忽如一夜春风来、千树万树梨花开。"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.textLabel.text=@"忽如一夜春风来、千树万树梨花开。";
    
    NSMutableAttributedString *attrText=[[NSMutableAttributedString alloc]initWithString:cell.textLabel.text];
    [attrText addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],
                              NSObliquenessAttributeName:@(0.4),
                              NSKernAttributeName:@(0.5)} range:NSMakeRange(0, cell.textLabel.text.length)];
    cell.textLabel.attributedText=attrText;
    
    return cell;
}


#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


- (void)setStringFontWithLabel:(UILabel*)label indexPath:(NSIndexPath*)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            NSMutableAttributedString *attrText=[[NSMutableAttributedString alloc]initWithString:label.text];
            [attrText addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],
                                      NSObliquenessAttributeName:@(0.4),
                                      NSKernAttributeName:@(0.5)} range:NSMakeRange(0, label.text.length)];
            label.attributedText=attrText;
//            label.font=[UIFont fontWithName:@"Zapfino" size:15];
        }
            break;
        case 1:
        {
            
        }
            break;
        case 2:
        {
            
        }
            break;
        case 3:
        {
            
        }
            break;
        case 4:
        {
            
        }
            break;
            
        default:
            break;
    }
}


@end
