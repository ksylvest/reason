//
//  KSStates.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-07-31.
//
//

#import "KSStates.h"
#import "KSState.h"

@interface KSStates ()

@property (nonatomic, strong) NSMutableDictionary *dictionary;

@end

@implementation KSStates

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Properties

- (NSMutableDictionary *)dictionary
{
    if (!_dictionary) _dictionary = [NSMutableDictionary dictionary];
    return _dictionary;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Modifiers

- (void)add:(KSState *)state
{
    self.dictionary[state.name] = state;
}

- (void)remove:(KSState *)state
{
    [self.dictionary removeObjectForKey:state.name];
}

@end
