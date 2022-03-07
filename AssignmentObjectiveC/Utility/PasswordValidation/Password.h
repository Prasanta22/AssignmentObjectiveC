//
//  NSObject+Password.h
//  AssignmentObjectiveC
//
//  Created by Prasanta Santikari on 07/03/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Password)
-(BOOL) isPasswordValid:(NSString *)password;
@end

NS_ASSUME_NONNULL_END
