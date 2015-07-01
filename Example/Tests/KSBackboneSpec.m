//
//  KSBackboneSpec.h
//  KSReason
//
//  Created by Kevin Sylvestre on 2015-06-17.
//  Copyright (c) 2015 Kevin Sylvestre. All rights reserved.
//

#import <KSReason/KSBackbone.h>
#import <KSReason/KSEnumerable.h>

SpecBegin(KSBackbone)

describe(@"KSBackbone", ^{
    
    describe(@"KSModel", ^{
        describe(@"-parse:", ^{
            it (@"parses a dictionary into attributes", ^{
                KSModel *model = [KSModel new];
                
                NSString *title = @"An Introduction to Cocoa";
                NSString *description = @"A basic overview of the fundamentals of cocoa.";
                [model parse:@{ @"title": title, @"description": description }];
                
                expect([model get:@"title"]).to.equal(title);
                expect([model get:@"description"]).to.equal(description);
            });
        });
        
        describe(@"-trigger:", ^{
            it (@"supports on and off on an object", ^{
                __block KSModel *model = [KSModel new];
                __block BOOL executed;

                void (^callback)(id) = ^(id object){
                    expect(object).to.equal(model);
                    executed = !!object;
                };
                
                executed = NO;
                [model on:@"change" callback:callback];
                [model trigger:@"change"];
                expect(executed).to.equal(YES);
                
                executed = NO;
                [model off:@"change" callback:callback];
                [model trigger:@"change"];
                expect(executed).to.equal(NO);
            });
        });
    });
    
    describe(@"KSCollection", ^{
        describe (@"-parse:", ^{
            it (@"parses a dictionary into attributes", ^{
                KSCollection *collection = [KSCollection new];
                
                NSString *title = @"An Introduction to Cocoa";
                NSString *description = @"A basic overview of the fundamentals of cocoa.";
                [collection parse:@[@{ @"title": title, @"description": description }]];
                
                expect(collection.models).to.beKindOf([NSArray class]);
                
                KSModel *model = [collection.models ks_find:^BOOL (KSModel *model) { return !!model; }];

                expect([model get:@"title"]).to.equal(title);
                expect([model get:@"description"]).to.equal(description);
            });
        });
        
        describe(@"-trigger:", ^{
            it (@"supports on and off on an object", ^{
                __block KSCollection *collection = [KSCollection new];
                __block BOOL executed;
                
                void (^callback)(id) = ^(id object){
                    expect(object).to.equal(collection);
                    executed = !!object;
                };
                
                executed = NO;
                [collection on:@"change" callback:callback];
                [collection trigger:@"change"];
                expect(executed).to.equal(YES);
                
                executed = NO;
                [collection off:@"change" callback:callback];
                [collection trigger:@"change"];
                expect(executed).to.equal(NO);
            });
        });
    });
    
});

SpecEnd
