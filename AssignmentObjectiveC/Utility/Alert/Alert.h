//
//  NSObject+Alert.h
//  AssignmentObjectiveC
//
//  Created by Prasanta Santikari on 07/03/22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Alert: NSObject
- (void) showAlertMsg:(UIViewController *)viewController title:(NSString *)title message:(NSString *)message;
@end

NS_ASSUME_NONNULL_END
