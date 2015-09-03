//
//  KSBlocksSpec.m
//  KSReason
//
//  Created by Kevin Sylvestre on 2015-09-02.
//  Copyright (c) 2015 Kevin Sylvestre. All rights reserved.
//

#import <KSReason/KSBlocks.h>

SpecBegin(KSBlocks)

describe(@"KSBlocks", ^{
    
    describe(@"KSDebounce", ^{
        describe(@"-debounce:block:", ^{
            it(@"handles multiple calls with a single execution", ^{
                KSDebounce *debounce = [KSDebounce new];
                NSTimeInterval waitTimeInterval = 0.2;
                
                __block NSInteger executions = 0;
                __block NSString *caller;

                [debounce debounce:waitTimeInterval block:^{
                    caller = @"Matt";
                    executions++;
                }];
                
                [debounce debounce:waitTimeInterval block:^{
                    caller = @"Mark";
                    executions++;
                }];
                
                [debounce debounce:waitTimeInterval block:^{
                    caller = @"Luke";
                    executions++;
                }];
                
                [debounce debounce:waitTimeInterval block:^{
                    caller = @"John";
                    executions++;
                }];
                
                [debounce execute];
                
                expect(caller).to.equal(@"John");
                expect(executions).notTo.equal(4);
                

            });
        });
    });
    
});

SpecEnd
