//
//  DetailsViewControllerTests.m
//  AssignmentObjectiveCTests
//
//  Created by Prasanta Santikari on 15/03/22.
//

#import <XCTest/XCTest.h>
#import "DetailsViewController.h"
#import "DetailsTableViewCell.h"

@interface DetailsViewControllerTests : XCTestCase
@property DetailsViewController *detailsVC;
@end

@implementation DetailsViewControllerTests

- (void)setUp {
    _detailsVC = [[DetailsViewController alloc]init];
    [_detailsVC viewDidLoad];
}

- (void)tearDown {
    _detailsVC = nil;
}

- (void)testNumberOfRow {
    [_detailsVC tableView:_detailsVC.tableView numberOfRowsInSection:_detailsVC.dataArray.count];
}

- (void)testCellOfRow {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    
    DetailsTableViewCell *cell = [self.detailsVC tableView:self.detailsVC.tableView cellForRowAtIndexPath:indexPath];
    XCTAssertNil(cell);
}

- (void)testLogoutButtonAction {
    [_detailsVC logoutButtonAction:[[UIButton alloc]init]];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
