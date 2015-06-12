//
//  NSDictionary+KSEnumerable.h
//  Pods
//
//  Created by Kevin Sylvestre on 2015-07-08.
//
//

#import <Foundation/Foundation.h>

typedef void (^KSDictionaryEachBlock)(id key, id value);
typedef void (^KSDictionaryEachIBlock)(id key, id value, NSUInteger index);
typedef id (^KSDictionaryMapBlock)(id key, id value);
typedef id (^KSDictionaryMapIBlock)(id key, id value, NSUInteger index);
typedef id (^KSDictionaryReduceBlock)(id memo, id key, id value);
typedef BOOL (^KSDictionaryFindBlock)(id key, id value);
typedef BOOL (^KSDictionaryAnyBlock)(id key, id value);
typedef BOOL (^KSDictionaryFilterBlock)(id key, id value);
typedef id (^KSDictionarySetBlock)(id key, id value);
typedef id (^KSDictionaryArrayBlock)(id key, id value);

/**
 A category for adding some additional functionaly to dictionaries.
 */
@interface NSDictionary (KSEnumerable)

/**
 Iterate over each element using a block.
 @param block A block executed on each element.
 */
- (void)KS_each:(KSDictionaryEachBlock)block;

/**
 Iterate over each element using a block that includes a helpful iteration index.
 @param block A block executed on each element.
 */
- (void)KS_eachi:(KSDictionaryEachIBlock)block;

/**
 An implementation of map from the map / reduce pattern.
 @param block A block with an object that is execute on every entry.
 */
- (NSDictionary *)KS_map:(KSDictionaryMapBlock)block;

/**
 An implementation of map from the map / reduce pattern that includes a helpful iteration index.
 @param block A block with an object that is execute on every entry with an index.
 */
- (NSDictionary *)KS_mapi:(KSDictionaryMapIBlock)block;

/**
 An implementation of map from the map / reduce pattern.
 @param block A block with an object that is execute on every entry and a memo.
 @param memo The inital memo (NULL is fine).
 */
- (id)KS_reduce:(KSDictionaryReduceBlock)block memo:(id)memo;

/**
 An implementation of find using a block for searching.
 @param block A block that is used for comparisons.
 */
- (id)KS_find:(KSDictionaryFindBlock)block;

/**
 Tests if any element matches the test.
 @param block A block that is used for testing.
 */
- (BOOL)KS_any:(KSDictionaryAnyBlock)block;

/**
 An implementation of filter.
 @param block A block that is used for filtering.
 */
- (NSDictionary *)KS_filter:(KSDictionaryFilterBlock)block;

/**
 Helps to convert a dictionary to a set using a block on each key and value pair.
 @param block A dictionary used to do the reducing of a key and value pair to an object.
 */
- (NSSet *)KS_set:(KSDictionarySetBlock)block;

/**
 Helps to convert a dictionary to an array using a block on each key and value pair.
 @param block A dictionary used to do the reducing of a key and value pair to an object.
 */
- (NSArray *)KS_array:(KSDictionaryArrayBlock)block;

/**
 Construct a new dictionary by merging the target and the parameter.
 @param dictionary A dictionary to create or update the source keys with.
 */
- (NSDictionary *)KS_extend:(NSDictionary *)dictionary;

/**
 Similar to extend but in reverse.
 @param dictionary A dictionary used by the source.
 */
- (NSDictionary *)KS_defaults:(NSDictionary *)dictionary;


@end
