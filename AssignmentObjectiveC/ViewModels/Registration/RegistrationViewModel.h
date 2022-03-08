//
//  RegistrationViewModel.h
//  AssignmentObjectiveC
//
//  Created by Prasanta Santikari on 08/03/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RegistrationViewModel: NSObject
- (void)registerWithEmail:(NSString *)email password:(NSString *)password username:(NSString *)username completion:(void (^)(NSString* success))completionBlock;
@end

NS_ASSUME_NONNULL_END
