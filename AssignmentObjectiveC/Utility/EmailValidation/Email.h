//
//  NSObject+Email.h
//  AssignmentObjectiveC
//
//  Created by Prasanta Santikari on 07/03/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Email)
- (BOOL)validateEmailWithString:(NSString*)email;
@end

NS_ASSUME_NONNULL_END
