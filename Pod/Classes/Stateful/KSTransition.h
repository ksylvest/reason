//
//  KSTransition.h
//  Pods
//
//  Created by Kevin Sylvestre on 2015-07-31.
//
//

#import <Foundation/Foundation.h>

@class KSState;

@interface KSTransition : NSObject

+ (instancetype)named:(NSString *)name from:(KSState *)from to:(KSState *)to;

- (id)initWithName:(NSString *)name from:(KSState *)from to:(KSState *)to;

@end
