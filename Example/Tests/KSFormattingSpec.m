//
//  KSFormattingSpec.m
//  KSReason
//
//  Created by Kevin Sylvestre on 2015-06-19.
//  Copyright (c) 2015 Kevin Sylvestre. All rights reserved.
//

#import <KSReason/KSFormatting.h>

SpecBegin(KSFormatting)

describe(@"KSFormatting", ^{
    
    describe(@"KSHumanizer", ^{
        describe(@"-sentence:", ^{
            it(@"handles collections with ease", ^{
                expect([KSHumanizer sentence:@[@"apple", @"lemon", @"peach"]]).to.equal(@"apple, lemon and peach");
            });
        });
    });
    
});

SpecEnd
