//
//  KSState.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-07-31.
//
//

#import "KSState.h"

@implementation KSState

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Factories

+ (instancetype)named:(NSString *)name
{
    return [[self alloc] initWithName:name];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Lifecycle

- (id)initWithName:(NSString *)name
{
    self = [super init];
    if (self) self.name = name;
    return self;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Helpers

- (void)entered:(KSStateChangeCallback)callback
{
    
}

- (void)exited:(KSStateChangeCallback)callback
{
    
}

- (BOOL)enterable
{
    return NO;
}

- (BOOL)exitable
{
    return NO;
}

- (void)enter
{
    
}

- (void)exit
{
    
}

@end
