//
//  KSDebounce
//  Pods
//
//  Created by Kevin Sylvestre on 2015-09-02.
//
//

#import "KSDebounce.h"

@implementation KSDebounce

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Main

- (void)debounce:(NSTimeInterval)waitTimeInterval block:(void (^)(void))block
{
    [self.timer invalidate];
    self.timer = NULL;

    self.block = block;
    
    SEL selector = @selector(execute);
    NSMethodSignature *invocationMethodSignature = [self.class instanceMethodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:invocationMethodSignature];
    invocation.selector = selector;
    invocation.target = self;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:waitTimeInterval invocation:invocation repeats:NO];
}

- (void)execute
{
    __block void (^block)(void) = self.block;
    self.block = NULL;
    self.timer = NULL;
    
    if (block) block();
}

- (void)dealloc
{
    [self.timer invalidate];
    self.timer = NULL;
    self.block = NULL;
}

@end
