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
        describe (@"-parse:", ^{
            it (@"parses a dictionary into attributes", ^{
                KSModel *model = [KSModel new];
                
                NSString *title = @"An Introduction to Cocoa";
                NSString *description = @"A basic overview of the fundamentals of cocoa.";
                [model parse:@{ @"title": title, @"description": description }];
                
                expect([model get:@"title"]).to.equal(title);
                expect([model get:@"description"]).to.equal(description);
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
                
                KSModel *model = [collection.models KS_find:^BOOL (KSModel *model) { return !!model; }];

                expect([model get:@"title"]).to.equal(title);
                expect([model get:@"description"]).to.equal(description);
            });
        });
    });
    
});

SpecEnd
