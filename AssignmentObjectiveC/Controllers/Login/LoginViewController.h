//
//  LoginViewController.h
//  AssignmentObjectiveC
//
//  Created by Prasanta Santikari on 07/03/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : UIViewController
-(void)navigateToDetailsVC;
-(void)navigateToRegisterVC ;
- (IBAction)loginButtonAction:(UIButton *)sender;
- (IBAction)registerButtonAction:(UIButton *)sender;
@end

NS_ASSUME_NONNULL_END
