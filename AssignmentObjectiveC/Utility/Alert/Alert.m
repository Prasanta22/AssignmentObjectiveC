//
//  NSObject+Alert.m
//  AssignmentObjectiveC
//
//  Created by Prasanta Santikari on 07/03/22.
//

#import "Alert.h"
#import <UIKit/UIKit.h>

@implementation Alert: NSObject

- (void) showAlertMsg:(UIViewController *)viewController title:(NSString *)title message:(NSString *)message {

    UIAlertController * alert = [UIAlertController alertControllerWithTitle : title
                                                                    message : message
                                                             preferredStyle : UIAlertControllerStyleAlert];

    UIAlertAction * ok = [UIAlertAction
                          actionWithTitle:@"OK"
                          style:UIAlertActionStyleDefault
                          handler:^(UIAlertAction * action)
                          { }];

    [alert addAction:ok];
    dispatch_async(dispatch_get_main_queue(), ^{
        [viewController presentViewController:alert animated:YES completion:nil];
    });
}
@end
