//
//  NSSet+KSEnumerable.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-07-08.
//
//

#import "NSSet+KSEnumerable.h"

@implementation NSSet (KSEnumerable)

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Iterate

- (void)KS_each:(KSSetEachBlock)block
{
    for (id object in self)
    {
        block(object);
    }
}

- (void)KS_eachi:(KSSetEachIBlock)block
{
    NSInteger index = 0;
    for (id object in self)
    {
        block(object, index++);
    }
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Map

- (NSSet *)KS_map:(KSSetMapBlock)block
{
    NSMutableSet *results = [NSMutableSet setWithCapacity:self.count];
    
    for (id object in self)
    {
        id mapped = block(object);
        if (mapped) [results addObject:mapped];
    }
    
    return results;
}

- (NSArray *)KS_mapi:(KSSetMapIBlock)block
{
    NSMutableArray *results = [NSMutableArray arrayWithCapacity:self.count];
    
    NSInteger index = 0;
    for (id object in self)
    {
        id mapped = block(object, index++);
        if (mapped) [results addObject:mapped];
    }
    
    return results;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Reduce

- (id)KS_reduce:(KSSetReduceBlock)block memo:(id)memo
{
    for (id object in self)
    {
        memo = block(memo, object);
    }
    
    return memo;
}


////////////////////////////////////////////////////////////////////////////////

#pragma mark - Find

- (id)KS_find:(KSSetFindBlock)block
{
    for (id object in self)
    {
        if (block(object)) return object;
    }
    
    return NULL;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Any

- (BOOL)KS_any:(KSSetAnyBlock)block
{
    return !![self KS_find:block];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Filtering

- (NSSet *)KS_filter:(KSSetFilterBlock)block
{
    NSMutableSet *results = [NSMutableSet setWithCapacity:self.count];
    
    for (id object in self)
    {
        if (block(object))
        {
            [results addObject:object];
        }
    }
    
    return results;
}

@end
