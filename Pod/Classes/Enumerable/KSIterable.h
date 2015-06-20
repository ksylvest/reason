//
//  KSIterable.h
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-19.
//
//

#import <Foundation/Foundation.h>

typedef void (^KSIterableEachBlock)(id object);
typedef void (^KSIterableEachIBlock)(id object, NSUInteger index);
typedef id (^KSIterableMapBlock)(id object);
typedef id (^KSIterableMapIBlock)(id object, NSUInteger index);
typedef id (^KSIterableReduceBlock)(id memo, id object);
typedef id (^KSIterableReduceIBlock)(id memo, id object, NSUInteger index);
typedef BOOL (^KSIterableTestBlock)(id object);

@protocol KSIterable <NSObject>

/**
 Iterate over each element using a block.
 @param block A block executed on each element.
 */
- (void)KS_each:(KSIterableEachBlock)block;

/**
 Iterate over each element using a block that includes a helpful iteration index.
 @param block A block executed on each element.
 */
- (void)KS_eachi:(KSIterableEachIBlock)block;

/**
 An implementation of map from the map / reduce pattern.
 @param block A block with an object that is execute on every entry.
 @return A Iterable where each element has had the block applied to it.
 */
- (instancetype)KS_map:(KSIterableMapBlock)block;

/**
 An implementation of map from the map / reduce pattern that includes a helpful iteration index.
 @param block A block with an object that is execute on every entry with an index.
 @return A Iterable where each element has had the block applied to it.
 */
- (instancetype)KS_mapi:(KSIterableMapIBlock)block;

/**
 An implementation of map from the map / reduce pattern.
 @param block A block with an object that is execute on every entry and a memo.
 @param memo The inital memo (NULL is fine).
 @return The value of memo that is returned after each block execution.
 */
- (id)KS_reduce:(KSIterableReduceBlock)block memo:(id)memo;

/**
 An implementation of map from the map / reduce pattern that includes a helpful iteration index.
 @param block A block with an object that is execute on every entry and a memo.
 @param memo The inital memo (NULL is fine).
 @return The value of memo that is returned after each block execution.
 */
- (id)KS_reducei:(KSIterableReduceIBlock)block memo:(id)memo;

/**
 An implementation of find using a block for searching.
 @param block A block that is used for comparisons.
 */
- (id)KS_find:(KSIterableTestBlock)block;

/**
 Tests if any element pass the block passed in for testing.
 @param block A block that is used for testing each element.
 @return If any element in the Iterable passes the block test.
 */
- (BOOL)KS_any:(KSIterableTestBlock)block;

/**
 Tests if all element pass the block passed in for testing.
 @param block A block that is used for testing each element.
 @return If all elements in the Iterable passes the block test.
 */
- (BOOL)KS_all:(KSIterableTestBlock)block;

/**
 Count the number of elements in the Iterable.
 @return The number of elements in the Iterable.
 */
- (NSUInteger)KS_size;

/**
 Look through each entry in the Iterable returning all entries that pass the block test.
 @param block A block that is used for filtering.
 @return A filtered Iterable.
 */
- (instancetype)KS_filter:(KSIterableTestBlock)block;

/**
 Look through each entry in the Iterable returning all entries that fail the block test.
 @param block A block that is used for filtering.
 @return A rejected Iterable.
 */
- (instancetype)KS_reject:(KSIterableTestBlock)block;

@end
