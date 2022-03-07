//
//  NSObject+LoginViewModel.h
//  AssignmentObjectiveC
//
//  Created by Prasanta Santikari on 07/03/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewModel: NSObject
- (void)loginWithEmail:(NSString *)email andPassword:(NSString *)password;
@end

NS_ASSUME_NONNULL_END
