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

- (void)ks_each:(KSIterableEachBlock)block
{
    for (id object in self)
    {
        block(object);
    }
}

- (void)ks_eachi:(KSIterableEachIBlock)block
{
    NSUInteger index = 0;
    for (id object in self)
    {
        block(object, index++);
    }
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Map

- (instancetype)ks_map:(KSIterableMapBlock)block
{
    NSMutableSet *results = [NSMutableSet setWithCapacity:self.count];
    
    for (id object in self)
    {
        id mapped = block(object);
        if (mapped) [results addObject:mapped];
    }
    
    return results;
}

- (instancetype)ks_mapi:(KSIterableMapIBlock)block
{
    NSMutableSet *results = [NSMutableSet setWithCapacity:self.count];
    
    NSUInteger index = 0;
    for (id object in self)
    {
        id mapped = block(object, index++);
        if (mapped) [results addObject:mapped];
    }
    
    return results;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Reduce

- (id)ks_reduce:(KSIterableReduceBlock)block memo:(id)memo
{
    for (id object in self)
    {
        memo = block(memo, object);
    }
    
    return memo;
}

- (id)ks_reducei:(KSIterableReduceIBlock)block memo:(id)memo
{
    NSUInteger index = 0;
    for (id object in self)
    {
        memo = block(memo, object, index++);
    }
    
    return memo;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Find

- (id)ks_find:(KSIterableTestBlock)block
{
    for (id object in self)
    {
        if (block(object)) return object;
    }
    
    return NULL;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Any

- (BOOL)ks_any:(KSIterableTestBlock)block
{
    for (id object in self)
    {
        if (block(object)) return YES;
    }
    return NO;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - All

- (BOOL)ks_all:(KSIterableTestBlock)block
{
    for (id object in self)
    {
        if (!block(object)) return NO;
    }
    return YES;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Size

- (NSUInteger)ks_size
{
    return self.count;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Empty

- (BOOL)ks_empty
{
    return !!self.count;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Filtering

- (instancetype)ks_filter:(KSIterableTestBlock)block
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

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Rejecting

- (instancetype)ks_reject:(KSIterableTestBlock)block
{
    return [self ks_filter:[self ks_negate:block]];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Union

- (instancetype)ks_union:(id <KSIterable>)iterable
{
    NSMutableOrderedSet *result = [[NSMutableOrderedSet alloc] initWithSet:self];
    
    for (id object in iterable)
    {
        [result addObject:object];
    }
    
    return [result set];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Intersect

- (instancetype)ks_intersection:(id<KSIterable>)iterable
{
    NSMutableOrderedSet *result = [[NSMutableOrderedSet alloc] init];
    NSMutableOrderedSet *helper = [[NSMutableOrderedSet alloc] initWithSet:self];
    
    for (id object in iterable)
    {
        if ([helper containsObject:object]) [result addObject:object];
    }
    
    return [result set];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Difference

- (instancetype)ks_difference:(id<KSIterable>)iterable
{
    NSMutableOrderedSet *result = [[NSMutableOrderedSet alloc] initWithSet:self];
    
    for (id object in iterable)
    {
        if ([result containsObject:object]) [result removeObject:object];
        else [result addObject:object];
    }
    
    return [result set];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Converters

- (NSArray *)ks_array:(KSIterableMapBlock)block
{
    NSMutableArray *results = [NSMutableArray arrayWithCapacity:self.count];
    
    for (id object in self)
    {
        [results addObject:block ? block(object) : object];
    }
    
    return results;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Negating

- (KSIterableTestBlock)ks_negate:(KSIterableTestBlock)block
{
    return ^BOOL (id object) { return !block(object); };
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Finders

- (id)ks_minimum
{
    return [self ks_reduce:^id(id memo, id object) {
        if ([memo compare:object] == NSOrderedAscending) return memo;
        else return object;
    } memo:NULL];
}

- (id)ks_maximum
{
    return [self ks_reduce:^id(id memo, id object) {
        if ([memo compare:object] == NSOrderedDescending) return memo;
        else return object;
    } memo:NULL];
}

- (id)ks_sample
{
    NSUInteger position = arc4random_uniform((int)self.count);
    
    NSInteger index = 0;
    for (id object in self)
    {
        if (index != position) index++;
        else return object;
    }
    
    return NULL;
}

@end
