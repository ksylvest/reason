//
//  KSExistentialismSpec.m
//  KSReason
//
//  Created by Kevin Sylvestre on 2015-06-19.
//  Copyright (c) 2015 Kevin Sylvestre. All rights reserved.
//

#import <KSReason/KSExistentialism.h>

SpecBegin(KSExistentialism)

describe(@"KSExistentialism", ^{
    
    describe(@"-ks_exists:", ^{
        it(@"is false for null", ^{
            expect([NSNull null].ks_exists).to.beFalsy;
        });
        
        it(@"is true for an object", ^{
            expect([NSObject new].ks_exists).to.beTruthy;
        });

        it(@"is false for a blank string", ^{
            expect(@"".ks_exists).to.beFalsy;
        });
        
        it(@"is true for a non blank string", ^{
            expect(@"Greetings!".ks_exists).to.beTruthy;
        });
        
        it(@"is false for a blank array", ^{
            expect([NSArray array].ks_exists).to.beFalsy;
        });
        
        it(@"is true for a non blank array", ^{
            expect([NSArray arrayWithObject:@"Greetings"].ks_exists).to.beTruthy;
        });
        
        it(@"is false for a blank set", ^{
            expect([NSSet set].ks_exists).to.beFalsy;
        });
        
        it(@"is true for a non blank set", ^{
            expect([NSSet setWithObject:@"Greetings"].ks_exists).to.beTruthy;
        });
        
        it(@"is false for a blank dictionary", ^{
            expect(@{}.ks_exists).to.beFalsy;
        });
        
        it(@"is true for a non blank dicitonary", ^{
            expect(@{ @"greeting": @"Greetings" }.ks_exists).to.beTruthy;
        });
    });
    
});

SpecEnd
