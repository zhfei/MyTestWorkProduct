//
//  TabBar4ListCell.h
//  MyTestWorkProduct
//
//  Created by 周飞 on 2018/9/20.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBar4ListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIImageView *flag;
@property (strong, nonatomic) NSString *imageName;

@end
