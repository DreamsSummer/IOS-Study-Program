//
//  _1___________iOS__Tests.m
//  01-切换文字颜色-第一个iOS程序Tests
//
//  Created by xiaomage on 15/5/25.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface _1___________iOS__Tests : XCTestCase

@end

@implementation _1___________iOS__Tests

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
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
