//
//  DetailsViewController.h
//  AssignmentObjectiveC
//
//  Created by Prasanta Santikari on 09/03/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
- (IBAction)logoutButtonAction:(UIButton *)sender;
@end

NS_ASSUME_NONNULL_END
