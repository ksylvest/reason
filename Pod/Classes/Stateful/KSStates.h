//
//  KSStates.h
//  Pods
//
//  Created by Kevin Sylvestre on 2015-07-31.
//
//

#import <Foundation/Foundation.h>

@class KSState;

@interface KSStates : NSObject

@property (nonatomic, strong) KSState *initial;

- (void)add:(KSState *)state;
- (void)remove:(KSState *)state;

@end
