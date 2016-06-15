//
//  SwizzingViewController.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/6/1.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "SwizzingViewController.h"
#import <objc/runtime.h>
#import "Utilities.h"

@implementation SwizzingViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.separatorInset=UIEdgeInsetsZero;
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    Method org= class_getInstanceMethod([self class], @selector(viewWillAppear:));
    Method swizzing=class_getInstanceMethod([self class], @selector(swizzingViewWillAppear:));
    
    BOOL addMethod= class_addMethod([self class], @selector(viewWillAppear:), method_getImplementation(swizzing), method_getTypeEncoding(swizzing));
    if (addMethod) {
        class_replaceMethod([self class], @selector(swizzingViewWillAppear:), method_getImplementation(org), method_getTypeEncoding(org));
    }else{
        method_exchangeImplementations(org, swizzing);
    }
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear......");

}

- (void)swizzingViewWillAppear:(BOOL)animated
{
    NSLog(@"swizzingViewWillAppear......");
    [self swizzingViewWillAppear:animated];
}

#pragma mark UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.5;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 0;
//}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID =@"myCell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
  
        if ([[Utilities systemVerson] floatValue]>8.0) {
            cell.layoutMargins=UIEdgeInsetsZero;
            cell.preservesSuperviewLayoutMargins=false;
        }else{
            cell.separatorInset=UIEdgeInsetsZero;

        }

        
    }
    cell.textLabel.text=@"标题 ";
    
    return cell;
}


#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


@end
