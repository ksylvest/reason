//
//  KSDebounce.h
//  Pods
//
//  Created by Kevin Sylvestre on 2015-09-02.
//
//

#import <Foundation/Foundation.h>

/**
 Defer a block from executing until after an interval ellapses where multiple calls are removed.
 */

@interface KSDebounce : NSObject

@property (nonatomic, copy) void (^block)(void);
@property (nonatomic, strong) NSTimer *timer;

/**
 Defer a block from executing until after a wait time interval elapses. Subsequent calls will reset and clear.

 @param waitTimeInterval The wait time interval.
 @param block The block to be executed after the wait time interval.
 */
- (void)debounce:(NSTimeInterval)waitTimeInterval block:(void (^)(void))block;

/**
 Trigger the debounce block (manual).
 */
- (void)execute;

@end
