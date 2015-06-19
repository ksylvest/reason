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
    
    describe(@".KS_exists", ^{
        it(@"is false for null", ^{
            expect([NSNull null].KS_exists).to.beFalsy;
        });
        
        it(@"is true for an object", ^{
            expect([NSObject new].KS_exists).to.beTruthy;
        });

        it(@"is false for a blank string", ^{
            expect(@"".KS_exists).to.beFalsy;
        });
        
        it(@"is true for a non blank string", ^{
            expect(@"Greetings!".KS_exists).to.beTruthy;
        });
        
        it(@"is false for a blank array", ^{
            expect([NSArray array].KS_exists).to.beFalsy;
        });
        
        it(@"is true for a non blank array", ^{
            expect([NSArray arrayWithObject:@"Greetings"].KS_exists).to.beTruthy;
        });
        
        it(@"is false for a blank set", ^{
            expect([NSSet set].KS_exists).to.beFalsy;
        });
        
        it(@"is true for a non blank set", ^{
            expect([NSSet setWithObject:@"Greetings"].KS_exists).to.beTruthy;
        });
        
        it(@"is false for a blank dictionary", ^{
            expect(@{}.KS_exists).to.beFalsy;
        });
        
        it(@"is true for a non blank dicitonary", ^{
            expect(@{ @"greeting": @"Greetings" }.KS_exists).to.beTruthy;
        });
    });
    
});

SpecEnd
