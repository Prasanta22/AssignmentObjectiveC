//
//  PasswordTests.m
//  AssignmentObjectiveCTests
//
//  Created by Prasanta Santikari on 15/03/22.
//

#import <XCTest/XCTest.h>
#import "Password.h"

@interface PasswordTests : XCTestCase
@property Password *pass;
@end

@implementation PasswordTests

- (void)setUp {
    _pass = [[Password alloc]init];
}

- (void)tearDown {
    _pass = nil;
}

- (void)testIsValidPassword {
    [_pass isValidPassword: @"Test@1234"];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
