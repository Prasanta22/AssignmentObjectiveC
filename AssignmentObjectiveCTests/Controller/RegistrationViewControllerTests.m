//
//  RegistrationViewControllerTests.m
//  AssignmentObjectiveCTests
//
//  Created by Prasanta Santikari on 14/03/22.
//

#import <XCTest/XCTest.h>
#import "RegistrationViewController.h"
#import "RegistrationViewModel.h"


@interface RegistrationViewControllerTests : XCTestCase
@property RegistrationViewController *registerVC;
@property RegistrationViewModel *registerModel;
@end

@implementation RegistrationViewControllerTests

- (void)setUp {
    _registerVC = [[RegistrationViewController alloc]init];
    _registerModel = [[RegistrationViewModel alloc]init];
    [_registerVC viewDidLoad];
}

- (void)tearDown {
    _registerVC = nil;
    _registerModel = nil;
}

- (void)testClearText {
    [_registerVC clearText];
}

- (void)testRegisterButtonAction {
    NSString *email = @"";
    NSString *password = @"";
    NSString *username = @"";
    [_registerModel registerWithEmail:email password:password username:username completion:^(NSString* message) {
        XCTAssertTrue(message);
    }];
    [_registerVC registrationButtonAction:[[UIButton alloc]init]];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
