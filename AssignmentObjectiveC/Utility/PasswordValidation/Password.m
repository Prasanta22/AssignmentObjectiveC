//
//  NSObject+Password.m
//  AssignmentObjectiveC
//
//  Created by Prasanta Santikari on 07/03/22.
//

#import "Password.h"

@implementation NSObject (Password)
-(BOOL) isPasswordValid:(NSString *)password {
    NSCharacterSet *upperCaseChars = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLKMNOPQRSTUVWXYZ"];
    NSCharacterSet *lowerCaseChars = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyz"];
    //NSCharacterSet *numbers = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];

    if ( [password length]<7 )
        return NO;  //too short
    NSRange range;
    range = [password rangeOfCharacterFromSet:[NSCharacterSet letterCharacterSet]];
    if ( !range.length )
        return NO;  // no letter
    range = [password rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]];
    if ( !range.length )
        return NO;  // no number;
    range = [password rangeOfCharacterFromSet:upperCaseChars];
    if ( !range.length )
        return NO;  // no uppercase letter;
    range = [password rangeOfCharacterFromSet:lowerCaseChars];
    if ( !range.length )
        return NO;  // no lowerCase Chars;

    return YES;
}
@end
