//
//  LoginViewController.m
//  AssignmentObjectiveC
//
//  Created by Prasanta Santikari on 07/03/22.
//

#import "LoginViewController.h"
#import "LoginViewModel.h"
#import "Alert.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)loginButtonAction:(UIButton *)sender {
    Alert *alert = [[Alert alloc]init];
    LoginViewModel *userObj = [[LoginViewModel alloc] init];
    
    // Here you can get the data from login form
    // and proceed to authenticate process
    NSString *email = _emailTextField.text;
    NSString *password = _passwordTextField.text;
    
    [userObj loginWithEmail:email password:password completion:^(NSString* message) {
        if ([message  isEqual: @"Email Required"]) {
            [alert showAlertMsg:self title:@"Email" message:@"Email Is Required"];
        } else if ([message  isEqual: @"Password Required"]) {
            [alert showAlertMsg:self title:@"Password" message:@"Password Is Required"];
        }  else if ([message  isEqual: @"Proper Email validate"]) {
            [alert showAlertMsg:self title:@"Email" message:@"Enter Proper Email-id"];
        } else if ([message  isEqual: @"Password Validate"]) {
            [alert showAlertMsg:self title:@"Password" message:@"Password must be minimum 8 characters,at least 1 Uppercase Alphabet, 1 Lowercase Alphabet,1 Number and 1 Special Character"];
        } else {
            [alert showAlertMsg:self title:@"Alert" message:@"Successful"];
        }
    }];
}

@end
