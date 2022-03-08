//
//  RegistrationViewModel.m
//  AssignmentObjectiveC
//
//  Created by Prasanta Santikari on 08/03/22.
//

#import "RegistrationViewModel.h"
#import "Email.h"
#import "Password.h"

@implementation RegistrationViewModel: NSObject
- (void)registerWithEmail:(NSString *)email password:(NSString *)password username:(NSString *)username completion:(void (^)(NSString* success))completionBlock{
    Email *emailvalidation = [[Email alloc] init];
    Password *passwordValidaton = [[Password alloc] init];
    if ([username  isEqual: @""]) completionBlock(@"Username Required");
    else if ([email  isEqual: @""]) completionBlock(@"Email Required");
    else if(![emailvalidation validateEmailWithString:email]) completionBlock(@"Proper Email validate");
    else if ([password  isEqual: @""]) completionBlock(@"Password Required");
    else if(![passwordValidaton isValidPassword:password]) completionBlock(@"Password Validate");
    else completionBlock(@"success");
}
@end
