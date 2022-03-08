//
//  NSObject+LoginViewModel.h
//  AssignmentObjectiveC
//
//  Created by Prasanta Santikari on 07/03/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewModel: NSObject
- (void)loginWithEmail:(NSString *)email password:(NSString *)password completion:(void (^)(NSString* success))completionBlock;
@end

NS_ASSUME_NONNULL_END
