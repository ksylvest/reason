//
//  NSDictionary+KSEnumerable.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-07-08.
//
//

#import "NSDictionary+KSEnumerable.h"

@implementation NSDictionary (KSEnumerable)

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Iterate

- (void)KS_each:(KSDictionaryEachBlock)block
{
    for (id key in self)
    {
        id value = self[key];
        block(key, value);
    }
}

- (void)KS_eachi:(KSDictionaryEachIBlock)block
{
    NSInteger index = 0;
    for (id key in self)
    {
        id value = self[value];
        block(key, value, index++);
    }
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Map

- (NSDictionary *)KS_map:(KSDictionaryMapBlock)block
{
    NSMutableDictionary *results = [NSMutableDictionary dictionaryWithCapacity:self.count];
    
    for (id key in self)
    {
        id value = self[key];

        id mapped = block(key, value);
        if (mapped) results[key] = mapped;
    }
    
    return results;
}

- (NSDictionary *)KS_mapi:(KSDictionaryMapIBlock)block
{
    NSMutableDictionary *results = [NSMutableDictionary dictionaryWithCapacity:self.count];
    
    NSUInteger index = 0;
    for (id key in self)
    {
        id value = self[key];
        
        id mapped = block(key, value, index++);
        if (mapped) results[key] = mapped;
    }
    
    return results;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Reduce

- (id)KS_reduce:(KSDictionaryReduceBlock)block memo:(id)memo
{
    for (id key in self)
    {
        id value = self[key];
        memo = block(memo, key, value);
    }
    
    return memo;
}


////////////////////////////////////////////////////////////////////////////////

#pragma mark - Find

- (id)KS_find:(KSDictionaryFindBlock)block
{
    for (id key in self)
    {
        id value = self[key];
        if (block(key, value)) return value;
    }
    
    return NULL;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Any

- (BOOL)KS_any:(KSDictionaryAnyBlock)block
{
    return !![self KS_find:block];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Filtering

- (NSDictionary *)KS_filter:(KSDictionaryFilterBlock)block
{
    NSMutableDictionary *results = [NSMutableDictionary dictionaryWithCapacity:self.count];
    
    for (id key in self)
    {
        id value = self[key];
        if (block(key, value))
        {
            results[key] = value;
        }
    }
    
    return results;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Converters

- (NSSet *)KS_set:(KSDictionarySetBlock)block
{
    NSMutableSet *results = [NSMutableSet setWithCapacity:self.count];
    
    for (id key in self)
    {
        id value = self[key];
        id object = block(key, value);
        [results addObject:object];
    }
    
    return results;
}

- (NSArray *)KS_array:(KSDictionaryArrayBlock)block
{
    NSMutableArray *results = [NSMutableArray arrayWithCapacity:self.count];
    
    for (id key in self)
    {
        id value = self[key];
        id object = block(key, value);
        [results addObject:object];
    }
    
    return results;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Extending

- (NSDictionary *)KS_extend:(NSDictionary *)extend
{
    NSMutableDictionary *results = [NSMutableDictionary dictionaryWithCapacity:self.count];
    
    for (id key in self)
    {
        id value = self[key];
        results[key] = value;
    }
    
    for (id key in extend)
    {
        id value = extend[key];
        results[key] = value;
    }
    
    return results;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Defaults

- (NSDictionary *)KS_defaults:(NSDictionary *)dictionary
{
    return [dictionary KS_extend:self];
}

@end
