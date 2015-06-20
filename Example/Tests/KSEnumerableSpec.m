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
    
    describe(@"-KS_each:", ^{
        it (@"iterates a set", ^{
            NSSet *collection = [NSSet setWithObjects:@"Canada", @"Greece", @"Russia", NULL];
            
            NSMutableSet *iterations = [NSMutableSet set];
            [collection KS_each:^(NSString *object){
                [iterations addObject:object];
            }];
            
            expect(collection).to.equal(iterations);
        });
        
        it (@"iterates an array", ^{
            NSArray *collection = [NSArray arrayWithObjects:@"Canada", @"Greece", @"Russia", NULL];
            
            NSMutableArray *iterations = [NSMutableArray array];
            [collection KS_each:^(NSString *object){
                [iterations addObject:object];
            }];
            
            expect(collection).to.equal(iterations);
        });
        
        it (@"iterates a dictionary", ^{
            NSDictionary *collection = @{ @"Canada": @"Ottawa", @"Greece": @"Athens", @"Russia": @"Moscow" };
            
            NSMutableDictionary *iterations = [NSMutableDictionary dictionary];
            [collection KS_each:^(NSString *key, NSString *value){
                iterations[key] = value;
            }];
            
            expect(collection).to.equal(iterations);
        });
    });
    
    describe(@"-KS_map:", ^{
        it (@"maps a set", ^{
            NSSet *collection = [NSSet setWithObjects:@"Canada", @"Greece", @"Russia", NULL];
            
            NSSet *mapped = [collection KS_map:^NSString *(NSString *object){
                return object;
            }];
            
            expect(collection).to.equal(mapped);
        });
        
        it (@"maps an array", ^{
            NSArray *collection = [NSArray arrayWithObjects:@"Canada", @"Greece", @"Russia", NULL];
            
            NSArray *mapped = [collection KS_map:^NSString *(NSString *object){
                return object;
            }];
            
            expect(collection).to.equal(mapped);
        });
        
        it (@"maps a dictionary", ^{
            NSDictionary *collection = @{ @"Canada": @"Ottawa", @"Greece": @"Athens", @"Russia": @"Moscow" };
            
            NSDictionary *mapped = [collection KS_map:^NSString *(NSString *key, NSString *value) {
                return value;
            }];
            
            expect(collection).to.equal(mapped);
        });
    });
    
    describe(@"-KS_reduce:", ^{
        it (@"reduces a set", ^{
            NSSet *collection = [NSSet setWithObjects:@"Greece", NULL];
            
            NSString *reduction = [collection KS_reduce:^NSString *(NSString *memo, NSString *object){
                return [NSString stringWithFormat:@"%@ %@", memo, object];
            } memo:@"reduction:"];
            
            expect(reduction).to.equal(@"reduction: Greece");
        });
        
        it (@"reduces an array", ^{
            NSArray *collection = [NSArray arrayWithObjects:@"Greece", NULL];
            
            NSString *reduction = [collection KS_reduce:^NSString *(NSString *memo, NSString *object) {
                return [NSString stringWithFormat:@"%@ %@", memo, object];
            } memo:@"reduction:"];
            
            expect(reduction).to.equal(@"reduction: Greece");
        });
        
        it (@"reduces a dictionary", ^{
            NSDictionary *collection = @{ @"Greece": @"Athens" };
            
            NSString *reduction = [collection KS_reduce:^NSString *(NSString *memo, NSString *key, NSString *value) {
                return [NSString stringWithFormat:@"%@ %@", memo, value];
            } memo:@"reduction:"];
            
            expect(reduction).to.equal(@"reduction: Athens");
        });
    });
    
    describe(@"-KS_find:", ^{
        it (@"searches a set", ^{
            NSSet *collection = [NSSet setWithObjects:@"Canada", @"Greece", @"Russia", NULL];
            
            expect([collection KS_find:^BOOL (NSString *object) {
                return [object isEqualToString:@"Greece"];
            }]).to.equal(@"Greece");
            
            expect([collection KS_find:^BOOL (NSString *object) {
                return [object isEqualToString:@"pi"];
            }]).to.beNil;
        });
        
        it (@"searches an array", ^{
            NSArray *collection = [NSArray arrayWithObjects:@"Canada", @"Greece", @"Russia", NULL];
            
            expect([collection KS_find:^BOOL (NSString *object) {
                return [object isEqualToString:@"Greece"];
            }]).to.equal(@"Greece");
            
            expect([collection KS_find:^BOOL (NSString *object) {
                return [object isEqualToString:@"pi"];
            }]).to.beNil;
        });
        
        it (@"searches a dictionary", ^{
            NSDictionary *collection = @{ @"Canada": @"Ottawa", @"Greece": @"Athens", @"Russia": @"Moscow" };
            
            expect([collection KS_find:^BOOL (NSString *key, NSString *value) {
                return [key isEqualToString:@"Greece"];
            }]).to.equal(@"Athens");
            
            expect([collection KS_find:^BOOL (NSString *key, NSString *value) {
                return [key isEqualToString:@"pi"];
            }]).to.beNil;
        });
    });
    
    describe(@"-KS_any:", ^{
        it (@"queries a set", ^{
            NSSet *collection = [NSSet setWithObjects:@"Canada", @"Greece", @"Russia", NULL];
            
            expect([collection KS_any:^BOOL (NSString *object) {
                return [object isEqualToString:@"Greece"];
            }]).to.beTruthy;
            
            expect([collection KS_any:^BOOL (NSString *object) {
                return [object isEqualToString:@"pi"];
            }]).to.beFalsy;
        });
        
        it (@"queries an array", ^{
            NSArray *collection = [NSArray arrayWithObjects:@"Canada", @"Greece", @"Russia", NULL];
            
            expect([collection KS_any:^BOOL (NSString *object) {
                return [object isEqualToString:@"Greece"];
            }]).to.beTruthy;
            
            expect([collection KS_any:^BOOL (NSString *object) {
                return [object isEqualToString:@"pi"];
            }]).to.beFalsy;
        });
        
        it (@"queries a dictionary", ^{
            NSDictionary *collection = @{ @"Canada": @"Ottawa", @"Greece": @"Athens", @"Russia": @"Moscow" };
            
            expect([collection KS_any:^BOOL (NSString *key, NSString *value) {
                return [key isEqualToString:@"Greece"];
            }]).to.beTruthy;
            
            expect([collection KS_any:^BOOL (NSString *key, NSString *value) {
                return [key isEqualToString:@"pi"];
            }]).to.beFalsy;
        });
    });

    describe(@"-KS_any", ^{
        it (@"queries a set", ^{
            NSSet *collection = [NSSet setWithObjects:@"Canada", @"Greece", @"Russia", NULL];
            
            expect([collection KS_any:^BOOL (NSString *object) {
                return !!object;
            }]).to.beTruthy;
            
            expect([collection KS_any:^BOOL (NSString *object) {
                return [object isEqualToString:@"Greece"];
            }]).to.beFalsy;
        });
        
        it (@"queries an array", ^{
            NSArray *collection = [NSArray arrayWithObjects:@"Canada", @"Greece", @"Russia", NULL];
            
            expect([collection KS_any:^BOOL (NSString *object) {
                return !!object;
            }]).to.beTruthy;
            
            expect([collection KS_any:^BOOL (NSString *object) {
                return [object isEqualToString:@"Greece"];
            }]).to.beFalsy;
        });
        
        it (@"queries a dictionary", ^{
            NSDictionary *collection = @{ @"Canada": @"Ottawa", @"Greece": @"Athens", @"Russia": @"Moscow" };
            
            expect([collection KS_any:^BOOL (NSString *key, NSString *value) {
                return key && value;
            }]).to.beTruthy;
            
            expect([collection KS_any:^BOOL (NSString *key, NSString *value) {
                return [key isEqualToString:@"Greece"] && [value isEqualToString:@"Greece"];
            }]).to.beFalsy;
        });
    });
    
    describe(@"-KS_filter", ^{
        it (@"filters a set", ^{
            NSSet *collection = [NSSet setWithObjects:@"Canada", @"Greece", @"Russia", NULL];
            
            expect([collection KS_filter:^BOOL (NSString *object) {
                return [object isEqualToString:@"Greece"];
            }]).to.equal([NSSet setWithObject:@"Greece"]);
            
            expect([collection KS_filter:^BOOL (NSString *object) {
                return [object isEqualToString:@"pi"];
            }]).to.equal([NSSet set]);
        });
        
        it (@"filters an array", ^{
            NSArray *collection = [NSArray arrayWithObjects:@"Canada", @"Greece", @"Russia", NULL];
            
            expect([collection KS_filter:^BOOL (NSString *object) {
                return [object isEqualToString:@"Greece"];
            }]).to.equal([NSArray arrayWithObject:@"Greece"]);
            
            expect([collection KS_filter:^BOOL (NSString *object) {
                return [object isEqualToString:@"pi"];
            }]).to.equal([NSArray array]);
        });
        
        it (@"filters a dictionary", ^{
            NSDictionary *collection = @{ @"Canada": @"Ottawa", @"Greece": @"Athens", @"Russia": @"Moscow" };
            
            expect([collection KS_filter:^BOOL (NSString *key, NSString *value) {
                return [key isEqualToString:@"Greece"];
            }]).to.equal(@{ @"Greece": @"Athens" });
            
            expect([collection KS_filter:^BOOL (NSString *key, NSString *value) {
                return [key isEqualToString:@"pi"];
            }]).to.equal(@{});
        });
    });
    
    
    describe(@"-KS_reject:", ^{
        it (@"rejects a set", ^{
            NSSet *collection = [NSSet setWithObjects:@"Canada", @"Greece", @"Russia", NULL];
            
            expect([collection KS_reject:^BOOL (NSString *object) {
                return [object isEqualToString:@"Canada"] || [object isEqualToString:@"Russia"];
            }]).to.equal([NSSet setWithObject:@"Greece"]);
            
            expect([collection KS_reject:^BOOL (NSString *object) {
                return !!object;
            }]).to.equal([NSSet set]);
        });
        
        it (@"rejects an array", ^{
            NSArray *collection = [NSArray arrayWithObjects:@"Canada", @"Greece", @"Russia", NULL];
            
            expect([collection KS_reject:^BOOL (NSString *object) {
                return [object isEqualToString:@"Canada"] || [object isEqualToString:@"Russia"];
            }]).to.equal([NSArray arrayWithObject:@"Greece"]);
            
            expect([collection KS_reject:^BOOL (NSString *object) {
                return !!object;
            }]).to.equal([NSArray array]);
        });
        
        it (@"rejects a dictionary", ^{
            NSDictionary *collection = @{ @"Canada": @"Ottawa", @"Greece": @"Athens", @"Russia": @"Moscow" };
            
            expect([collection KS_reject:^BOOL (NSString *key, NSString *value) {
                return [key isEqualToString:@"Canada"] || [key isEqualToString:@"Russia"];
            }]).to.equal(@{ @"Greece": @"Athens" });
            
            expect([collection KS_reject:^BOOL (NSString *key, NSString *value) {
                return key || value;
            }]).to.equal(@{});
        });
    });
    
    describe(@"-KS_keys", ^{
        it (@"exposes an accessor for all the keys", ^{
            NSDictionary *collection = @{ @"Canada": @"Ottawa", @"Greece": @"Athens", @"Russia": @"Moscow" };
            expect(collection.KS_keys).to.contain(@"Greece");
        });
    });

    describe(@"-KS_values", ^{
        it (@"exposes an accessor for all the values", ^{
            NSDictionary *collection = @{ @"Canada": @"Ottawa", @"Greece": @"Athens", @"Russia": @"Moscow" };
            expect(collection.KS_values).to.contain(@"Athens");
        });
    });

});

SpecEnd
