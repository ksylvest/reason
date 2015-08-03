//
//  KSFSM.h
//  Pods
//
//  Created by Kevin Sylvestre on 2015-07-31.
//
//

#import <Foundation/Foundation.h>

@class KSState;

@class KSStates;
@class KSTransitions;

@interface KSFSM : NSObject

@property (nonatomic, strong) KSState *state;

@property (nonatomic, strong) KSStates *states;
@property (nonatomic, strong) KSTransitions *transitions;

@end
