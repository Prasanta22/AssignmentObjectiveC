//
//  RegistrationViewController.m
//  AssignmentObjectiveC
//
//  Created by Prasanta Santikari on 08/03/22.
//

#import "RegistrationViewController.h"
#import "RegistrationViewModel.h"
#import "Alert.h"

@interface RegistrationViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@end

@implementation RegistrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)registrationButtonAction:(UIButton *)sender {
    Alert *alert = [[Alert alloc]init];
    RegistrationViewModel *registerObj = [[RegistrationViewModel alloc] init];
    
    // Here you can get the data from register form
    // and proceed to authenticate process
    NSString *userName = _userNameTextField.text;
    NSString *email = _emailTextField.text;
    NSString *password = _passwordTextField.text;
    
    [registerObj registerWithEmail:email password:password username:userName completion:^(NSString* message) {
        if ([message  isEqual: @"Username Required"]) {
            [alert showAlertMsg:self title:@"Username" message:@"Username Is Required"];
        } else if ([message  isEqual: @"Email Required"]) {
            [alert showAlertMsg:self title:@"Email" message:@"Email Is Required"];
        } else if ([message  isEqual: @"Password Required"]) {
            [alert showAlertMsg:self title:@"Password" message:@"Password Is Required"];
        }  else if ([message  isEqual: @"Proper Email validate"]) {
            [alert showAlertMsg:self title:@"Email" message:@"Enter Proper Email-id"];
        } else if ([message  isEqual: @"Password Validate"]) {
            [alert showAlertMsg:self title:@"Password" message:@"Password must be minimum 8 characters,at least 1 Uppercase Alphabet, 1 Lowercase Alphabet,1 Number and 1 Special Character"];
        } else {
            [alert showAlertMsg:self title:@"Alert" message:@"Successful"];
            [self clearText];
        }
    }];
}

-(void)clearText {
    _userNameTextField.text = @"";
    _emailTextField.text = @"";
    _passwordTextField.text = @"";
}

@end
