//
//  KSEnumerableSpec.m
//  KSReason
//
//  Created by Kevin Sylvestre on 2015-06-08.
//  Copyright (c) 2015 Kevin Sylvestre. All rights reserved.
//

#import <KSReason/KSEnumerable.h>

SpecBegin(KSEnumerable)

describe(@"KSEnumerable", ^{
    
    describe(@"-ks_each:", ^{
        it (@"iterates a set", ^{
            NSSet *collection = [NSSet setWithObjects:@"Canada", @"Greece", @"Russia", NULL];
            
            NSMutableSet *iterations = [NSMutableSet set];
            [collection ks_each:^(NSString *object){
                [iterations addObject:object];
            }];
            
            expect(collection).to.equal(iterations);
        });
        
        it (@"iterates an array", ^{
            NSArray *collection = [NSArray arrayWithObjects:@"Canada", @"Greece", @"Russia", NULL];
            
            NSMutableArray *iterations = [NSMutableArray array];
            [collection ks_each:^(NSString *object){
                [iterations addObject:object];
            }];
            
            expect(collection).to.equal(iterations);
        });
        
        it (@"iterates a dictionary", ^{
            NSDictionary *collection = @{ @"Canada": @"Ottawa", @"Greece": @"Athens", @"Russia": @"Moscow" };
            
            NSMutableDictionary *iterations = [NSMutableDictionary dictionary];
            [collection ks_each:^(NSString *key, NSString *value){
                iterations[key] = value;
            }];
            
            expect(collection).to.equal(iterations);
        });
    });
    
    describe(@"-ks_map:", ^{
        it (@"maps a set", ^{
            NSSet *collection = [NSSet setWithObjects:@"Canada", @"Greece", @"Russia", NULL];
            
            NSSet *mapped = [collection ks_map:^NSString *(NSString *object){
                return object;
            }];
            
            expect(collection).to.equal(mapped);
        });
        
        it (@"maps an array", ^{
            NSArray *collection = [NSArray arrayWithObjects:@"Canada", @"Greece", @"Russia", NULL];
            
            NSArray *mapped = [collection ks_map:^NSString *(NSString *object){
                return object;
            }];
            
            expect(collection).to.equal(mapped);
        });
        
        it (@"maps a dictionary", ^{
            NSDictionary *collection = @{ @"Canada": @"Ottawa", @"Greece": @"Athens", @"Russia": @"Moscow" };
            
            NSDictionary *mapped = [collection ks_map:^NSString *(NSString *key, NSString *value) {
                return value;
            }];
            
            expect(collection).to.equal(mapped);
        });
    });
    
    describe(@"-ks_reduce:", ^{
        it (@"reduces a set", ^{
            NSSet *collection = [NSSet setWithObjects:@"Greece", NULL];
            
            NSString *reduction = [collection ks_reduce:^NSString *(NSString *memo, NSString *object){
                return [NSString stringWithFormat:@"%@ %@", memo, object];
            } memo:@"reduction:"];
            
            expect(reduction).to.equal(@"reduction: Greece");
        });
        
        it (@"reduces an array", ^{
            NSArray *collection = [NSArray arrayWithObjects:@"Greece", NULL];
            
            NSString *reduction = [collection ks_reduce:^NSString *(NSString *memo, NSString *object) {
                return [NSString stringWithFormat:@"%@ %@", memo, object];
            } memo:@"reduction:"];
            
            expect(reduction).to.equal(@"reduction: Greece");
        });
        
        it (@"reduces a dictionary", ^{
            NSDictionary *collection = @{ @"Greece": @"Athens" };
            
            NSString *reduction = [collection ks_reduce:^NSString *(NSString *memo, NSString *key, NSString *value) {
                return [NSString stringWithFormat:@"%@ %@", memo, value];
            } memo:@"reduction:"];
            
            expect(reduction).to.equal(@"reduction: Athens");
        });
    });
    
    describe(@"-ks_find:", ^{
        it (@"searches a set", ^{
            NSSet *collection = [NSSet setWithObjects:@"Canada", @"Greece", @"Russia", NULL];
            
            expect([collection ks_find:^BOOL (NSString *object) {
                return [object isEqualToString:@"Greece"];
            }]).to.equal(@"Greece");
            
            expect([collection ks_find:^BOOL (NSString *object) {
                return [object isEqualToString:@"pi"];
            }]).to.beNil;
        });
        
        it (@"searches an array", ^{
            NSArray *collection = [NSArray arrayWithObjects:@"Canada", @"Greece", @"Russia", NULL];
            
            expect([collection ks_find:^BOOL (NSString *object) {
                return [object isEqualToString:@"Greece"];
            }]).to.equal(@"Greece");
            
            expect([collection ks_find:^BOOL (NSString *object) {
                return [object isEqualToString:@"pi"];
            }]).to.beNil;
        });
        
        it (@"searches a dictionary", ^{
            NSDictionary *collection = @{ @"Canada": @"Ottawa", @"Greece": @"Athens", @"Russia": @"Moscow" };
            
            expect([collection ks_find:^BOOL (NSString *key, NSString *value) {
                return [key isEqualToString:@"Greece"];
            }]).to.equal(@"Athens");
            
            expect([collection ks_find:^BOOL (NSString *key, NSString *value) {
                return [key isEqualToString:@"pi"];
            }]).to.beNil;
        });
    });
    
    describe(@"-ks_any:", ^{
        it (@"queries a set", ^{
            NSSet *collection = [NSSet setWithObjects:@"Canada", @"Greece", @"Russia", NULL];
            
            expect([collection ks_any:^BOOL (NSString *object) {
                return [object isEqualToString:@"Greece"];
            }]).to.beTruthy;
            
            expect([collection ks_any:^BOOL (NSString *object) {
                return [object isEqualToString:@"pi"];
            }]).to.beFalsy;
        });
        
        it (@"queries an array", ^{
            NSArray *collection = [NSArray arrayWithObjects:@"Canada", @"Greece", @"Russia", NULL];
            
            expect([collection ks_any:^BOOL (NSString *object) {
                return [object isEqualToString:@"Greece"];
            }]).to.beTruthy;
            
            expect([collection ks_any:^BOOL (NSString *object) {
                return [object isEqualToString:@"pi"];
            }]).to.beFalsy;
        });
        
        it (@"queries a dictionary", ^{
            NSDictionary *collection = @{ @"Canada": @"Ottawa", @"Greece": @"Athens", @"Russia": @"Moscow" };
            
            expect([collection ks_any:^BOOL (NSString *key, NSString *value) {
                return [key isEqualToString:@"Greece"];
            }]).to.beTruthy;
            
            expect([collection ks_any:^BOOL (NSString *key, NSString *value) {
                return [key isEqualToString:@"pi"];
            }]).to.beFalsy;
        });
    });

    describe(@"-ks_any", ^{
        it (@"queries a set", ^{
            NSSet *collection = [NSSet setWithObjects:@"Canada", @"Greece", @"Russia", NULL];
            
            expect([collection ks_any:^BOOL (NSString *object) {
                return !!object;
            }]).to.beTruthy;
            
            expect([collection ks_any:^BOOL (NSString *object) {
                return [object isEqualToString:@"Greece"];
            }]).to.beFalsy;
        });
        
        it (@"queries an array", ^{
            NSArray *collection = [NSArray arrayWithObjects:@"Canada", @"Greece", @"Russia", NULL];
            
            expect([collection ks_any:^BOOL (NSString *object) {
                return !!object;
            }]).to.beTruthy;
            
            expect([collection ks_any:^BOOL (NSString *object) {
                return [object isEqualToString:@"Greece"];
            }]).to.beFalsy;
        });
        
        it (@"queries a dictionary", ^{
            NSDictionary *collection = @{ @"Canada": @"Ottawa", @"Greece": @"Athens", @"Russia": @"Moscow" };
            
            expect([collection ks_any:^BOOL (NSString *key, NSString *value) {
                return key && value;
            }]).to.beTruthy;
            
            expect([collection ks_any:^BOOL (NSString *key, NSString *value) {
                return [key isEqualToString:@"Greece"] && [value isEqualToString:@"Greece"];
            }]).to.beFalsy;
        });
    });
    
    describe(@"-ks_filter", ^{
        it (@"filters a set", ^{
            NSSet *collection = [NSSet setWithObjects:@"Canada", @"Greece", @"Russia", NULL];
            
            expect([collection ks_filter:^BOOL (NSString *object) {
                return [object isEqualToString:@"Greece"];
            }]).to.equal([NSSet setWithObject:@"Greece"]);
            
            expect([collection ks_filter:^BOOL (NSString *object) {
                return [object isEqualToString:@"pi"];
            }]).to.equal([NSSet set]);
        });
        
        it (@"filters an array", ^{
            NSArray *collection = [NSArray arrayWithObjects:@"Canada", @"Greece", @"Russia", NULL];
            
            expect([collection ks_filter:^BOOL (NSString *object) {
                return [object isEqualToString:@"Greece"];
            }]).to.equal([NSArray arrayWithObject:@"Greece"]);
            
            expect([collection ks_filter:^BOOL (NSString *object) {
                return [object isEqualToString:@"pi"];
            }]).to.equal([NSArray array]);
        });
        
        it (@"filters a dictionary", ^{
            NSDictionary *collection = @{ @"Canada": @"Ottawa", @"Greece": @"Athens", @"Russia": @"Moscow" };
            
            expect([collection ks_filter:^BOOL (NSString *key, NSString *value) {
                return [key isEqualToString:@"Greece"];
            }]).to.equal(@{ @"Greece": @"Athens" });
            
            expect([collection ks_filter:^BOOL (NSString *key, NSString *value) {
                return [key isEqualToString:@"pi"];
            }]).to.equal(@{});
        });
    });
    
    
    describe(@"-ks_reject:", ^{
        it (@"rejects a set", ^{
            NSSet *collection = [NSSet setWithObjects:@"Canada", @"Greece", @"Russia", NULL];
            
            expect([collection ks_reject:^BOOL (NSString *object) {
                return [object isEqualToString:@"Canada"] || [object isEqualToString:@"Russia"];
            }]).to.equal([NSSet setWithObject:@"Greece"]);
            
            expect([collection ks_reject:^BOOL (NSString *object) {
                return !!object;
            }]).to.equal([NSSet set]);
        });
        
        it (@"rejects an array", ^{
            NSArray *collection = [NSArray arrayWithObjects:@"Canada", @"Greece", @"Russia", NULL];
            
            expect([collection ks_reject:^BOOL (NSString *object) {
                return [object isEqualToString:@"Canada"] || [object isEqualToString:@"Russia"];
            }]).to.equal([NSArray arrayWithObject:@"Greece"]);
            
            expect([collection ks_reject:^BOOL (NSString *object) {
                return !!object;
            }]).to.equal([NSArray array]);
        });
        
        it (@"rejects a dictionary", ^{
            NSDictionary *collection = @{ @"Canada": @"Ottawa", @"Greece": @"Athens", @"Russia": @"Moscow" };
            
            expect([collection ks_reject:^BOOL (NSString *key, NSString *value) {
                return [key isEqualToString:@"Canada"] || [key isEqualToString:@"Russia"];
            }]).to.equal(@{ @"Greece": @"Athens" });
            
            expect([collection ks_reject:^BOOL (NSString *key, NSString *value) {
                return key || value;
            }]).to.equal(@{});
        });
    });
    
    describe(@"-ks_union:", ^{
        it (@"unions sets", ^{
            NSSet *alpha = [NSSet setWithObjects:@"A", @"B", NULL];
            NSSet *omega = [NSSet setWithObjects:@"B", @"C", NULL];
            
            expect([alpha ks_union:omega]).to.equal([NSSet setWithObjects:@"A", @"B", @"C", NULL]);
        });
        
        it (@"unions arrays", ^{
            NSArray *alpha = [NSArray arrayWithObjects:@"A", @"B", NULL];
            NSArray *omega = [NSArray arrayWithObjects:@"B", @"C", NULL];
        
            expect([alpha ks_union:omega]).to.equal([NSArray arrayWithObjects:@"A", @"B", @"C", NULL]);
        });
        
        it (@"unions dictionaries", ^{
            NSDictionary *alpha = @{ @"A": @"A", @"B": @"B" };
            NSDictionary *omega = @{ @"B": @"B", @"C": @"C" };
            
            expect([alpha ks_union:omega]).to.equal(@{ @"A": @"A", @"B": @"B", @"C": @"C" });
        });
    });
    
    describe(@"-ks_intersection:", ^{
        it (@"intersects sets", ^{
            NSSet *alpha = [NSSet setWithObjects:@"A", @"B", NULL];
            NSSet *omega = [NSSet setWithObjects:@"B", @"C", NULL];
            
            expect([alpha ks_intersection:omega]).to.equal([NSSet setWithObjects:@"B", NULL]);
        });
        
        it (@"intersects arrays", ^{
            NSArray *alpha = [NSArray arrayWithObjects:@"A", @"B", NULL];
            NSArray *omega = [NSArray arrayWithObjects:@"B", @"C", NULL];
            
            expect([alpha ks_intersection:omega]).to.equal([NSArray arrayWithObjects:@"B", NULL]);
        });
        
        it (@"intersects dictionaries", ^{
            NSDictionary *alpha = @{ @"A": @"A", @"B": @"B" };
            NSDictionary *omega = @{ @"B": @"B", @"C": @"C" };
            
            expect([alpha ks_intersection:omega]).to.equal(@{ @"B": @"B" });
        });
    });
    
    describe(@"-ks_difference:", ^{
        it (@"differences sets", ^{
            NSSet *alpha = [NSSet setWithObjects:@"A", @"B", NULL];
            NSSet *omega = [NSSet setWithObjects:@"B", @"C", NULL];
            
            expect([alpha ks_difference:omega]).to.equal([NSSet setWithObjects:@"A", @"C", NULL]);
        });
        
        it (@"differences arrays", ^{
            NSArray *alpha = [NSArray arrayWithObjects:@"A", @"B", NULL];
            NSArray *omega = [NSArray arrayWithObjects:@"B", @"C", NULL];
            
            expect([alpha ks_difference:omega]).to.equal([NSArray arrayWithObjects:@"A", @"C", NULL]);
        });
        
        it (@"differences dictionaries", ^{
            NSDictionary *alpha = @{ @"A": @"A", @"B": @"B" };
            NSDictionary *omega = @{ @"B": @"B", @"C": @"C" };
            
            expect([alpha ks_difference:omega]).to.equal(@{ @"A": @"A", @"C": @"C" });
        });
    });
    
    describe(@"-ks_keys", ^{
        it (@"exposes an accessor for all the keys", ^{
            NSDictionary *collection = @{ @"Canada": @"Ottawa", @"Greece": @"Athens", @"Russia": @"Moscow" };
            expect(collection.ks_keys).to.contain(@"Greece");
        });
    });

    describe(@"-ks_values", ^{
        it (@"exposes an accessor for all the values", ^{
            NSDictionary *collection = @{ @"Canada": @"Ottawa", @"Greece": @"Athens", @"Russia": @"Moscow" };
            expect(collection.ks_values).to.contain(@"Athens");
        });
    });

    describe(@"-ks_minimum", ^{
        it (@"exposes the minimum in an dictionary", ^{
            NSDictionary *collection = @{ @"USD": @1.00, @"CDN": @1.25, @"EUR": @0.75 };
            expect(collection.ks_minimum).to.equal(@0.75);
        });
        
        it (@"exposes the minimum in an array", ^{
            NSArray *collection = [NSArray arrayWithObjects:@1.00, @1.25, @0.75, NULL];
            expect(collection.ks_minimum).to.equal(@0.75);
        });
        
        it (@"exposes the minimum in an set", ^{
            NSSet *collection = [NSSet setWithObjects:@1.0, @1.25, @0.75, NULL];
            expect(collection.ks_minimum).to.equal(@0.75);
        });
    });
    
    describe(@"-ks_maximum", ^{
        it (@"exposes the maximum in an dictionary", ^{
            NSDictionary *collection = @{ @"USD": @1.0, @"CDN": @1.25, @"EUR": @0.75 };
            expect(collection.ks_maximum).to.equal(@1.25);
        });
        
        it (@"exposes the maximum in an array", ^{
            NSArray *collection = [NSArray arrayWithObjects:@1.0, @1.25, @0.75, NULL];
            expect(collection.ks_maximum).to.equal(@1.25);
        });
        
        it (@"exposes the maximum in an set", ^{
            NSSet *collection = [NSSet setWithObjects:@1.00, @1.25, @0.75, NULL];
            expect(collection.ks_maximum).to.equal(@1.25);
        });
    });
    
    describe(@"-ks_sample", ^{
        it (@"exposes the maximum in an dictionary", ^{
            NSDictionary *collection = @{ @"USD": @1.0, @"CDN": @1.25, @"EUR": @0.75 };
            expect(collection.ks_sample).to.beKindOf([NSNumber class]);
        });
        
        it (@"exposes the maximum in an array", ^{
            NSArray *collection = [NSArray arrayWithObjects:@1.0, @1.25, @0.75, NULL];
            expect(collection.ks_sample).to.beKindOf([NSNumber class]);
        });
        
        it (@"exposes the maximum in an set", ^{
            NSSet *collection = [NSSet setWithObjects:@1.0, @1.25, @0.75, NULL];
            expect(collection.ks_sample).to.beKindOf([NSNumber class]);
        });
    });
    
});

SpecEnd
