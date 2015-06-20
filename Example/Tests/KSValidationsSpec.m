//
//  KSValidationsSpec.m
//  KSReason
//
//  Created by Kevin Sylvestre on 2015-06-19.
//  Copyright (c) 2015 Kevin Sylvestre. All rights reserved.
//

#import <KSReason/KSValidations.h>

SpecBegin(KSValidations)

describe(@"KSValidations", ^{
    
    describe(@"KSValidator", ^{

        describe(@"+validator:", ^{
            it(@"takes validations and can execute them", ^{

                NSDictionary *attributes = @{
                  @"name": @"",
                  @"tagline": @"...",
                };

                NSDictionary *validations = @{
                  @"name": @{ KSValidate.presence: @{} },
                  @"email": @{ KSValidate.format: @{ KSValidate.with: KSValidateFormatEmail } },
                  @"phone": @{ KSValidate.format: @{ KSValidate.with: KSValidateFormatPhone } },
                  @"tagline": @{ KSValidate.length: @{ KSValidate.minimum: @20, KSValidate.maximum: @80 } },
                };
                
                NSString *expected;
                expected = @"name can't be blank and tagline must be between 20 and 80 characters";
                
                KSValidator *validator = [KSValidator validator:validations];
                [validator validate:attributes];
                expect(validator.humanize).to.equal(expected);

            });
        });
        
        describe(@"+length:is:", ^{
            it(@"is true if a length matches", ^{
                expect([KSValidator length:@"test" is:4]).to.beTruthy;
            });
            it(@"is flase otherwise", ^{
                expect([KSValidator length:@"testing" is:4]).to.beFalsy;
            });
        });
        
        describe(@"+length:minimum:", ^{
            it(@"is true if a length is greater than a minimum", ^{
                expect([KSValidator length:@"test" minimum:3]).to.beTruthy;
            });
            it(@"is flase otherwise", ^{
                expect([KSValidator length:@"te" minimum:3]).to.beFalsy;
            });
        });
        
        describe(@"+length:maximum:", ^{
            it(@"is true if a length is less than a maximum", ^{
                expect([KSValidator length:@"te" maximum:3]).to.beTruthy;
            });
            it(@"is flase otherwise", ^{
                expect([KSValidator length:@"test" maximum:3]).to.beFalsy;
            });
        });
        
        describe(@"+format:with:", ^{
            it(@"matches with email", ^{
                expect([KSValidator format:@"" with:KSValidateFormatEmail]).to.beFalsy;
                expect([KSValidator format:@"name@company.com" with:KSValidateFormatEmail]).to.beTruthy;
            });
            it(@"matches with phone", ^{
                expect([KSValidator format:@"" with:KSValidateFormatPhone]).to.beFalsy;
                expect([KSValidator format:@"+1 555-555-5555" with:KSValidateFormatPhone]).to.beTruthy;
            });
        });
        
        describe(@"+inclusion:in:", ^{
            it(@"is true if the object is present in the collection", ^{
                expect([KSValidator inclusion:@"blue" collection:@[@"blue"]]).to.beTruthy;
            });
            it(@"is flase otherwise", ^{
                expect([KSValidator inclusion:@"pink" collection:@[@"blue"]]).to.beFalsy;
            });
        });
        
        describe(@"+exclusion:in:", ^{
            it(@"is true if the object is present", ^{
                expect([KSValidator exclusion:@"blue" collection:@[@"blue"]]).to.beFalsy;
            });
            it(@"is flase otherwise", ^{
                expect([KSValidator exclusion:@"pink" collection:@[@"blue"]]).to.beTruthy;
            });
        });
        
        describe(@"+absence:", ^{
            it(@"is true if the object is absent", ^{
                expect([KSValidator absence:@""]).to.beTruthy;
            });
            it(@"is flase otherwise", ^{
               expect([KSValidator presence:@"Greetings!"]).to.beFalsy;
            });
        });
        
        describe(@"+presence:", ^{
            it(@"is true if the object is present", ^{
                expect([KSValidator presence:@"Greetings!"]).to.beTruthy;
            });
            it(@"is flase otherwise", ^{
                expect([KSValidator presence:@""]).to.beFalsy;
            });
        });
        
    });
    
});

SpecEnd
