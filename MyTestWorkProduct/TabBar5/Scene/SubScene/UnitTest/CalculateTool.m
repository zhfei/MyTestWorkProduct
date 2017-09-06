//
//  CalculateTool.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 2017/8/29.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "CalculateTool.h"

@implementation CalculateTool
CGFloat add(CGFloat num1,CGFloat num2) {
    return num1 + num2;
}

CGFloat subtract(CGFloat num1,CGFloat num2) {
    return num1 - num2;
}

CGFloat multiply(CGFloat num1,CGFloat num2) {
    return num1 * num2;
}

CGFloat divide(CGFloat num1,CGFloat num2) {
    return num1 / num2;
}

CGFloat action(CGFloat num1,CGFloat num2) {

    CGFloat result = add(num1, num2);
    result = subtract(result, num2);
    result = multiply(result, num2);
    result = divide(result, num2);
    return result;
}

@end
