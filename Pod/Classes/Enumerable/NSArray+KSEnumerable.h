//
//  NSArray+KSEnumerable.h
//  Pods
//
//  Created by Kevin Sylvestre on 2015-07-08.
//
//

#import <Foundation/Foundation.h>

typedef void (^KSArrayEachBlock)(id object);
typedef void (^KSArrayEachIBlock)(id object, NSUInteger index);
typedef id (^KSArrayMapBlock)(id object);
typedef id (^KSArrayMapIBlock)(id object, NSUInteger index);
typedef id (^KSArrayReduceBlock)(id memo, id object);
typedef BOOL (^KSArrayFindBlock)(id object);
typedef BOOL (^KSArrayAnyBlock)(id object);
typedef BOOL (^KSArrayFilterBlock)(id object);

/**
 A category for adding some additional functionaly to arrays.
 */
@interface NSArray (KSEnumerable)

/**
 Iterate over each element using a block.
 @param block A block executed on each element.
 */
- (void)KS_each:(KSArrayEachBlock)block;

/**
 Iterate over each element using a block that includes a helpful iteration index.
 @param block A block executed on each element.
 */
- (void)KS_eachi:(KSArrayEachIBlock)block;

/**
 An implementation of map from the map / reduce pattern.
 @param block A block with an object that is execute on every entry.
 */
- (NSArray *)KS_map:(KSArrayMapBlock)block;

/**
 An implementation of map from the map / reduce pattern that includes a helpful iteration index.
 @param block A block with an object that is execute on every entry with an index.
 */
- (NSArray *)KS_mapi:(KSArrayMapIBlock)block;

/**
 An implementation of map from the map / reduce pattern.
 @param block A block with an object that is execute on every entry and a memo.
 @param memo The inital memo (NULL is fine).
 */
- (id)KS_reduce:(KSArrayReduceBlock)block memo:(id)memo;

/**
 An implementation of find using a block for searching.
 @param block A block that is used for comparisons.
 */
- (id)KS_find:(KSArrayFindBlock)block;

/**
 Tests if any element matches the test.
 @param block A block that is used for testing.
 */
- (BOOL)KS_any:(KSArrayAnyBlock)block;

/**
 An implementation of filter.
 @param block A block that is used for filtering.
 */
- (NSArray *)KS_filter:(KSArrayFilterBlock)block;

@end
