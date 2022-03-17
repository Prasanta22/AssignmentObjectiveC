//
//  LoginViewControllerTests.m
//  AssignmentObjectiveCTests
//
//  Created by Prasanta Santikari on 14/03/22.
//

#import <XCTest/XCTest.h>
#import "LoginViewController.h"
#import "LoginViewModel.h"

@interface LoginViewControllerTests : XCTestCase
@property LoginViewController *loginVC;
@property LoginViewModel *loginModel;
@end

@implementation LoginViewControllerTests

- (void)setUp {
    _loginVC = [[LoginViewController alloc]init];
    _loginModel = [[LoginViewModel alloc]init];
    [_loginVC viewDidLoad];
    [_loginVC viewWillAppear:true];
}

- (void)tearDown {
    _loginVC = nil;
    _loginModel = nil;
}

- (void)testNavigateToDetailsVC {
    [_loginVC navigateToDetailsVC];
}

- (void)testNavigateToRegisterVC {
    [_loginVC navigateToRegisterVC];
}

- (void)testloginButtonAction {
    NSString *email = @"";
    NSString *password = @"";
    [_loginModel loginWithEmail:email password:password completion:^(NSString* message) {
        XCTAssertTrue(message);
    }];
    [_loginVC loginButtonAction:[[UIButton alloc]init]];
}

- (void)testregisterButtonAction {
    [_loginVC registerButtonAction:[[UIButton alloc]init]];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
