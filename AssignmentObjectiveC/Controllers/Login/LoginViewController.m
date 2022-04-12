//
//  LoginViewController.m
//  AssignmentObjectiveC
//
//  Created by Prasanta Santikari on 07/03/22.
//

#import "LoginViewController.h"
#import "LoginViewModel.h"
#import "Alert.h"
#import "DetailsViewController.h"
#import "RegistrationViewController.h"
#import "KeychainItemWrapper.h"
#import "Constants.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:true];
    _emailTextField.text = @"";
    _passwordTextField.text = @"";
}
- (IBAction)loginButtonAction:(UIButton *)sender {
    Alert *alert = [[Alert alloc]init];
    LoginViewModel *loginObj = [[LoginViewModel alloc] init];
    
    // Here you can get the data from login form
    // and proceed to authenticate process
    NSString *email = _emailTextField.text;
    NSString *password = _passwordTextField.text;
    
    [loginObj loginWithEmail:email password:password completion:^(NSString* message) {
        if ([message  isEqual: blank_Email]) {
            [alert showAlertMsg:self title:emailText message:blank_Email];
        } else if ([message  isEqual: blank_Password]) {
            [alert showAlertMsg:self title:passwordText message:blank_Password];
        }  else if ([message  isEqual: validate_Email]) {
            [alert showAlertMsg:self title:emailText message:validate_Email_Message];
        } else if ([message  isEqual: validate_Password]) {
            [alert showAlertMsg:self title:passwordText message:validate_Password_Message];
        } else {
            KeychainItemWrapper *keychainItem = [[KeychainItemWrapper alloc] initWithIdentifier:@"YourAppLogin" accessGroup:nil];
            NSData *password22 = [keychainItem objectForKey:(__bridge id)kSecValueData];
            NSString *emailData = [keychainItem objectForKey:(__bridge id)kSecAttrAccount];
            NSString* passwordValue = [[NSString alloc] initWithData:password22 encoding:NSUTF8StringEncoding];
            if ([self.emailTextField.text isEqual:emailData] && [self.passwordTextField.text isEqual:passwordValue]) {
                [self navigateToDetailsVC];
            } else {
                [alert showAlertMsg:self title:alertMessage message:userNotFound];
            }
            
        }
    }];
}
- (IBAction)registerButtonAction:(UIButton *)sender {
    [self navigateToRegisterVC];
}

-(void)navigateToDetailsVC {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                                 bundle:nil];
    DetailsViewController *obj =
            [storyboard instantiateViewControllerWithIdentifier:@"DetailsViewController"];
    [self.navigationController pushViewController:obj animated:YES];
}

-(void)navigateToRegisterVC {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                                 bundle:nil];
    RegistrationViewController *obj =
            [storyboard instantiateViewControllerWithIdentifier:@"RegistrationViewController"];
    [self.navigationController pushViewController:obj animated:YES];
}

@end
