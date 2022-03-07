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
    Alert *gcvc = [[Alert alloc]init];
    [gcvc showAlertMsg:self title:@"title" message:@"jsbjb"];
    LoginViewModel *userObj = [[LoginViewModel alloc] init];
    // Here you can get the data from login form
    // and proceed to authenticate process
    NSString *email = _emailTextField.text;
    NSString *password = _passwordTextField.text;
    [userObj loginWithEmail:email andPassword:password];
    
}

@end
