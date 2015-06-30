//
//  KSParserSpec.m
//  KSReason
//
//  Created by Kevin Sylvestre on 2015-06-08.
//  Copyright (c) 2015 Kevin Sylvestre. All rights reserved.
//

#import <KSReason/KSParser.h>

SpecBegin(KSParser)

describe(@"KSParser", ^{
    
    describe(@"NSObject", ^{
        it(@"handles NULL values", ^{
            expect([NSObject ks_parse:[NSNull null]]).to.beNil;
        });
    });
    
    describe(@"NSDate", ^{
        it(@"handles NULL values", ^{
            expect([NSDate ks_parse:[NSNull null]]).to.beNil;
        });
        it(@"handles dates values", ^{
            expect([NSDate ks_parse:[NSDate date]]).to.beKindOf([NSDate class]);
        });
        it(@"handles other values", ^{
            NSString *string = @"2015-01-01T12:00:00.000Z";
            expect([NSDate ks_parse:string]).to.beKindOf([NSDate class]);
        });
    });
    
    describe(@"NSString", ^{
        it(@"handles NULL values", ^{
            expect([NSString ks_parse:[NSNull null]]).to.beNil;
        });
        it(@"handles string values", ^{
            expect([NSString ks_parse:@"12.34"]).to.equal(@"12.34");
        });
        it(@"handles other values", ^{
            expect([NSString ks_parse:@12.34]).to.equal(@"12.34");
        });
    });
    
    describe(@"NSNumber", ^{
        it(@"handles NULL values", ^{
            expect([NSNumber ks_parse:[NSNull null]]).to.beNil;
        });
        it(@"handles number values", ^{
            expect([NSNumber ks_parse:@12.34]).to.equal(@12.34);
        });
        it(@"handles other values", ^{
            expect([NSNumber ks_parse:@"12.34"]).to.equal(@12.34);
        });
    });
    
    describe(@"NSArray", ^{
        it(@"handles NULL values", ^{
            expect([NSArray ks_parse:[NSNull null]]).to.beNil;
        });
        it(@"handles array values", ^{
            expect([NSArray ks_parse:[NSArray array]]).to.beKindOf([NSArray class]);
        });
        it(@"ignores other values", ^{
            expect([NSArray ks_parse:[NSString string]]).to.beNil;
        });
    });
    
    describe(@"NSDictionary", ^{
        it(@"handles NULL values", ^{
            expect([NSDictionary ks_parse:[NSNull null]]).to.beNil;
        });
        it(@"handles dictionary values", ^{
            expect([NSDictionary ks_parse:[NSDictionary dictionary]]).to.beKindOf([NSDictionary class]);
        });
        it(@"ignores other values", ^{
            expect([NSDictionary ks_parse:[NSString string]]).to.beNil;
        });
    });
    
    describe(@"NSSet", ^{
        it(@"handles NULL values", ^{
            expect([NSSet ks_parse:[NSNull null]]).to.beNil;
        });
        it(@"handles set values", ^{
            expect([NSSet ks_parse:[NSSet set]]).to.beKindOf([NSSet class]);
        });
        it(@"ignores other values", ^{
            expect([NSSet ks_parse:[NSString string]]).to.beNil;
        });
    });
    
});

SpecEnd
