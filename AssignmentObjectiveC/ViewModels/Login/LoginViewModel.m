//
//  NSObject+LoginViewModel.m
//  AssignmentObjectiveC
//
//  Created by Prasanta Santikari on 07/03/22.
//

#import "LoginViewModel.h"
#import "Email.h"
#import "Password.h"

@implementation LoginViewModel: NSObject

- (void)loginWithEmail:(NSString *)email password:(NSString *)password completion:(void (^)(NSString* success))completionBlock{
    Email *emailvalidation = [[Email alloc] init];
    Password *passwordValidaton = [[Password alloc] init];
    
    if ([email  isEqual: @""]) completionBlock(@"Email Required");
    else if(![emailvalidation validateEmailWithString:email]) completionBlock(@"Proper Email validate");
    else if ([password  isEqual: @""]) completionBlock(@"Password Required");
    else if(![passwordValidaton isValidPassword:password]) completionBlock(@"Password Validate");
    else completionBlock(@"success");
}
@end
