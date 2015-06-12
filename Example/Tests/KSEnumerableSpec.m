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
    
    describe(@".KS_each", ^{
        it (@"iterates a set", ^{
            NSSet *collection = [NSSet setWithObjects:@"alpha", @"sigma", @"omega", NULL];
            
            NSMutableSet *iterations = [NSMutableSet set];
            [collection KS_each:^(NSString *object){
                [iterations addObject:object];
            }];
            
            expect(collection).to.equal(iterations);
        });
        
        it (@"iterates an array", ^{
            NSArray *collection = [NSArray arrayWithObjects:@"alpha", @"sigma", @"omega", NULL];
            
            NSMutableArray *iterations = [NSMutableArray array];
            [collection KS_each:^(NSString *object){
                [iterations addObject:object];
            }];
            
            expect(collection).to.equal(iterations);
        });
        
        it (@"iterates a dictionary", ^{
            NSDictionary *collection = @{ @"alpha" : @"alpha", @"sigma": @"sigma", @"omega": @"omega" };
            
            NSMutableDictionary *iterations = [NSMutableDictionary dictionary];
            [collection KS_each:^(NSString *key, NSString *value){
                iterations[key] = value;
            }];
            
            expect(collection).to.equal(iterations);
        });
    });
    
    describe(@".KS_map", ^{
        it (@"maps a set", ^{
            NSSet *collection = [NSSet setWithObjects:@"alpha", @"sigma", @"omega", NULL];
            
            NSSet *mapped = [collection KS_map:^NSString *(NSString *object){
                return object;
            }];
            
            expect(collection).to.equal(mapped);
        });
        
        it (@"maps an array", ^{
            NSArray *collection = [NSArray arrayWithObjects:@"alpha", @"sigma", @"omega", NULL];
            
            NSArray *mapped = [collection KS_map:^NSString *(NSString *object){
                return object;
            }];
            
            expect(collection).to.equal(mapped);
        });
        
        it (@"maps a dictionary", ^{
            NSDictionary *collection = @{ @"alpha" : @"alpha", @"sigma": @"sigma", @"omega": @"omega" };
            
            NSDictionary *mapped = [collection KS_map:^NSString *(NSString *key, NSString *value) {
                return value;
            }];
            
            expect(collection).to.equal(mapped);
        });
    });
    
    describe(@".KS_reduce", ^{
        it (@"reduces a set", ^{
            NSSet *collection = [NSSet setWithObjects:@"sigma", NULL];
            
            NSString *reduction = [collection KS_reduce:^NSString *(NSString *memo, NSString *object){
                return [NSString stringWithFormat:@"%@ %@", memo, object];
            } memo:@"reduction:"];
            
            expect(reduction).to.equal(@"reduction: sigma");
        });
        
        it (@"reduces an array", ^{
            NSArray *collection = [NSArray arrayWithObjects:@"sigma", NULL];
            
            NSString *reduction = [collection KS_reduce:^NSString *(NSString *memo, NSString *object) {
                return [NSString stringWithFormat:@"%@ %@", memo, object];
            } memo:@"reduction:"];
            
            expect(reduction).to.equal(@"reduction: sigma");
        });
        
        it (@"reduces a dictionary", ^{
            NSDictionary *collection = @{ @"sigma": @"sigma" };
            
            NSString *reduction = [collection KS_reduce:^NSString *(NSString *memo, NSString *key, NSString *value) {
                return [NSString stringWithFormat:@"%@ %@", memo, value];
            } memo:@"reduction:"];
            
            expect(reduction).to.equal(@"reduction: sigma");
        });
    });
    
    describe(@".KS_find", ^{
        it (@"searches a set", ^{
            NSSet *collection = [NSSet setWithObjects:@"alpha", @"sigma", @"omega", NULL];
            
            expect([collection KS_find:^BOOL (NSString *object) {
                return [object isEqualToString:@"sigma"];
            }]).to.equal(@"sigma");
            
            expect([collection KS_find:^BOOL (NSString *object) {
                return [object isEqualToString:@"pi"];
            }]).to.beNil;
        });
        
        it (@"searches an array", ^{
            NSArray *collection = [NSArray arrayWithObjects:@"alpha", @"sigma", @"omega", NULL];
            
            expect([collection KS_find:^BOOL (NSString *object) {
                return [object isEqualToString:@"sigma"];
            }]).to.equal(@"sigma");
            
            expect([collection KS_find:^BOOL (NSString *object) {
                return [object isEqualToString:@"pi"];
            }]).to.beNil;
        });
        
        it (@"searches a dictionary", ^{
            NSDictionary *collection = @{ @"alpha" : @"alpha", @"sigma": @"sigma", @"omega": @"omega" };
            
            expect([collection KS_find:^BOOL (NSString *key, NSString *value) {
                return [key isEqualToString:@"sigma"];
            }]).to.equal(@"sigma");
            
            expect([collection KS_find:^BOOL (NSString *key, NSString *value) {
                return [key isEqualToString:@"pi"];
            }]).to.beNil;
        });
    });
    
    describe(@".KS_any", ^{
        it (@"queries a set", ^{
            NSSet *collection = [NSSet setWithObjects:@"alpha", @"sigma", @"omega", NULL];
            
            expect([collection KS_any:^BOOL (NSString *object) {
                return [object isEqualToString:@"sigma"];
            }]).to.beTruthy;
            
            expect([collection KS_any:^BOOL (NSString *object) {
                return [object isEqualToString:@"pi"];
            }]).to.beFalsy;
        });
        
        it (@"queries an array", ^{
            NSArray *collection = [NSArray arrayWithObjects:@"alpha", @"sigma", @"omega", NULL];
            
            expect([collection KS_any:^BOOL (NSString *object) {
                return [object isEqualToString:@"sigma"];
            }]).to.beTruthy;
            
            expect([collection KS_any:^BOOL (NSString *object) {
                return [object isEqualToString:@"pi"];
            }]).to.beFalsy;
        });
        
        it (@"queries a dictionary", ^{
            NSDictionary *collection = @{ @"alpha" : @"alpha", @"sigma": @"sigma", @"omega": @"omega" };
            
            expect([collection KS_any:^BOOL (NSString *key, NSString *value) {
                return [key isEqualToString:@"sigma"];
            }]).to.beTruthy;
            
            expect([collection KS_any:^BOOL (NSString *key, NSString *value) {
                return [key isEqualToString:@"pi"];
            }]).to.beFalsy;
        });
    });
    
    describe(@".KS_filter", ^{
        it (@"filters a set", ^{
            NSSet *collection = [NSSet setWithObjects:@"alpha", @"sigma", @"omega", NULL];
            
            expect([collection KS_filter:^BOOL (NSString *object) {
                return [object isEqualToString:@"sigma"];
            }]).to.equal([NSSet setWithObject:@"sigma"]);
            
            expect([collection KS_filter:^BOOL (NSString *object) {
                return [object isEqualToString:@"pi"];
            }]).to.equal([NSSet set]);
        });
        
        it (@"filters an array", ^{
            NSArray *collection = [NSArray arrayWithObjects:@"alpha", @"sigma", @"omega", NULL];
            
            expect([collection KS_filter:^BOOL (NSString *object) {
                return [object isEqualToString:@"sigma"];
            }]).to.equal([NSArray arrayWithObject:@"sigma"]);
            
            expect([collection KS_filter:^BOOL (NSString *object) {
                return [object isEqualToString:@"pi"];
            }]).to.equal([NSArray array]);
        });
        
        it (@"filters a dictionary", ^{
            NSDictionary *collection = @{ @"alpha" : @"alpha", @"sigma": @"sigma", @"omega": @"omega" };
            
            expect([collection KS_filter:^BOOL (NSString *key, NSString *value) {
                return [key isEqualToString:@"sigma"];
            }]).to.equal(@{ @"sigma": @"sigma" });
            
            expect([collection KS_filter:^BOOL (NSString *key, NSString *value) {
                return [key isEqualToString:@"pi"];
            }]).to.equal(@{});
        });
    });
});

SpecEnd
