//
//  NSSet+KSEnumerable.h
//  Pods
//
//  Created by Kevin Sylvestre on 2015-07-08.
//
//

#import <Foundation/Foundation.h>

typedef void (^KSSetEachBlock)(id object);
typedef void (^KSSetEachIBlock)(id object, NSUInteger index);
typedef id (^KSSetMapBlock)(id object);
typedef id (^KSSetMapIBlock)(id object, NSUInteger index);
typedef id (^KSSetReduceBlock)(id memo, id object);
typedef BOOL (^KSSetFindBlock)(id object);
typedef BOOL (^KSSetAnyBlock)(id object);
typedef BOOL (^KSSetFilterBlock)(id object);


/**
 A category for adding some additional functionaly to dictionaries.
 */

@interface NSSet (KSEnumerable)

/**
 An implementation of filter.
 @param block A block that is used for filtering.
 */
- (NSArray *)KS_filter:(KSSetFilterBlock)block;

/**
 Iterate over each element using a block.
 @param block A block executed on each element.
 */
- (void)KS_each:(KSSetEachBlock)block;

/**
 Iterate over each element using a block that includes a helpful iteration index.
 @param block A block executed on each element.
 */
- (void)KS_eachi:(KSSetEachIBlock)block;

/**
 An implementation of map from the map / reduce pattern.
 @param block A block with an object that is execute on every entry.
 */
- (NSSet *)KS_map:(KSSetMapBlock)block;

/**
 An implementation of map from the map / reduce pattern that includes a helpful iteration index.
 @param block A block with an object that is execute on every entry with an index.
 */
- (NSArray *)KS_mapi:(KSSetMapIBlock)block;

/**
 An implementation of map from the map / reduce pattern.
 @param block A block with an object that is execute on every entry and a memo.
 @param memo The inital memo (NULL is fine).
 */
- (id)KS_reduce:(KSSetReduceBlock)block memo:(id)memo;

/**
 An implementation of find using a block for searching.
 @param block A block that is used for comparisons.
 */
- (id)KS_find:(KSSetFindBlock)block;

/**
 Tests if any element matches the test.
 @param block A block that is used for testing.
 */
- (BOOL)KS_any:(KSSetAnyBlock)block;


@end
