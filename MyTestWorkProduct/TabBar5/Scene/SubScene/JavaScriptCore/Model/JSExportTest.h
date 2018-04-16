//
//  JSExportTest.h
//  MyTestWorkProduct
//
//  Created by 周飞 on 18/4/16.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>


@protocol JSExportTest <JSExport>
@property (nonatomic, assign) NSInteger sum;
JSExportAs(add, - (NSInteger)add:(int)a b:(int)b);

@end
