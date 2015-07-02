//
//  KSInflectionSpec.m
//  KSReason
//
//  Created by Kevin Sylvestre on 2015-06-12.
//  Copyright (c) 2015 Kevin Sylvestre. All rights reserved.
//

#import <KSReason/KSInflection.h>

SpecBegin(KSInflection)

describe(@"KSInflection", ^{
    
    describe(@"KSInflector", ^{

        describe(@"-ks_pluralize", ^{
            it(@"handles a converting common strings from singular to plural", ^{
                
                NSDictionary *tests = @{
                                        @"user": @"users",
                                        @"account": @"accounts",
                                        @"cherry": @"cherries",
                                        @"potato": @"potatoes",
                                        };
                
                for (NSString *test in tests)
                    expect(test.ks_pluralize).to.equal(tests[test]);
                
                [KSInflector config:^(KSInflector *inflector) {
                    [inflector plural:@"ox$" replacement:@"oxen"];
                }];
                
                expect(@"ox".ks_pluralize).to.equal(@"oxen");
            });
        });
        
        describe(@"-ks_singularize", ^{
            it(@"handles a converting common strings from singular to plural", ^{
                
                NSDictionary *tests = @{
                                        @"users": @"user",
                                        @"accounts": @"account",
                                        @"cherries": @"cherry",
                                        @"potatoes": @"potato",
                                        };
                
                for (NSString *test in tests)
                    expect(test.ks_singularize).to.equal(tests[test]);
                
                [KSInflector config:^(KSInflector *inflector) {
                    [inflector singular:@"oxen$" replacement:@"ox"];
                }];
                
                expect(@"oxen".ks_singularize).to.equal(@"ox");
            });
        });
        
        describe(@"-inflect:string:", ^{
            it (@"handles singular and plural cases", ^{
                expect([KSInflector.shared inflect:1 string:@"star"]).to.equal(@"1 star");
                expect([KSInflector.shared inflect:2 string:@"star"]).to.equal(@"2 stars");
                expect([KSInflector.shared inflect:3 string:@"star"]).to.equal(@"3 stars");
            });
        });
        
    });
    
});

SpecEnd
