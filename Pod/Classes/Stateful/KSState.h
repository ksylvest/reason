//
//  KSState.h
//  Pods
//
//  Created by Kevin Sylvestre on 2015-07-31.
//
//

#import <Foundation/Foundation.h>

@class KSState;
@class KSTransition;

typedef void (^KSStateChangeCallback)(KSState *state, KSTransition *transition);

@interface KSState : NSObject

+ (instancetype)named:(NSString *)name;

@property (nonatomic, strong) NSString *name;

- (void)entered:(KSStateChangeCallback)callback;
- (void)exited:(KSStateChangeCallback)callback;

- (BOOL)enterable;
- (BOOL)exitable;

- (void)enter;
- (void)exit;

@end
