//
//  MyTestWorkProductTests.m
//  MyTestWorkProductTests
//
//  Created by zhoufei on 15/11/2.
//  Copyright © 2015年 zhoufei. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CalculateTool.h"

@interface MyTestWorkProductTests : XCTestCase

@end

@implementation MyTestWorkProductTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    CGFloat result = action(10, 10);
    XCTAssert(result == 10,@"计算错误");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        for (int i = 0; i < 8000; i++) {
            NSLog(@"%f",action(i, i+1));
        }
    }];
}

@end
