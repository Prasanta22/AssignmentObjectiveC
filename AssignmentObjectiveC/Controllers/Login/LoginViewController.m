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
        if ([message  isEqual: @"Email Required"]) {
            [alert showAlertMsg:self title:@"Email" message:@"Email Is Required"];
        } else if ([message  isEqual: @"Password Required"]) {
            [alert showAlertMsg:self title:@"Password" message:@"Password Is Required"];
        }  else if ([message  isEqual: @"Proper Email validate"]) {
            [alert showAlertMsg:self title:@"Email" message:@"Enter Proper Email-id"];
        } else if ([message  isEqual: @"Password Validate"]) {
            [alert showAlertMsg:self title:@"Password" message:@"Password must be minimum 8 characters,at least 1 Uppercase Alphabet, 1 Lowercase Alphabet,1 Number and 1 Special Character"];
        } else {
            KeychainItemWrapper *keychainItem = [[KeychainItemWrapper alloc] initWithIdentifier:@"YourAppLogin" accessGroup:nil];
            NSData *password22 = [keychainItem objectForKey:(__bridge id)kSecValueData];
            NSString *emailData = [keychainItem objectForKey:(__bridge id)kSecAttrAccount];
            NSString* passwordValue = [[NSString alloc] initWithData:password22 encoding:NSUTF8StringEncoding];
            if ([self.emailTextField.text isEqual:emailData] && [self.passwordTextField.text isEqual:passwordValue]) {
                [self navigateToDetailsVC];
            } else {
                [alert showAlertMsg:self title:@"Alert" message:@"User Not Found"];
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
