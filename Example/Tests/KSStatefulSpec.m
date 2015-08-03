//
//  KSStatefulSpec.m
//  KSReason
//
//  Created by Kevin Sylvestre on 2015-07-31.
//  Copyright (c) 2015 Kevin Sylvestre. All rights reserved.
//

#import <KSReason/KSStateful.h>

SpecBegin(KSFormatting)

describe(@"KSStateful", ^{
    
    __block BOOL daytime;
    __block enum { KSWeeday , KSWeekend} date;
    
    __block typeof(self) bself = self;
    
    __block KSState *sleeping = [KSState named:@"sleeping"];
    __block KSState *working = [KSState named:@"working"];
    __block KSState *resting = [KSState named:@"resting"];
    __block KSState *dead = [KSState named:@"dead"];
    
    __block KSFSM *fsm = [KSFSM new];

    [fsm.states add:sleeping];
    [fsm.states add:working];
    [fsm.states add:resting];
    [fsm.states add:dead];
    
    fsm.states.initial = resting;
    
    [fsm.transitions add:[KSTransition named:@"work" from:sleeping to:working]];
    [fsm.transitions add:[KSTransition named:@"rest" from:sleeping to:resting]];
    [fsm.transitions add:[KSTransition named:@"sleep" from:@[working,resting] to:sleeping]];
    [fsm.transitions add:[KSTransition named:@"sleep" from:@[sleeping,working,resting] to:dead]];
    
    [work enterable:^BOOL {
        return date == KSWeekend;
    }];
    
    [rest enterable:^BOOL {
        return date == KSWeekend;
    }];
    
    [sleep exitable:^BOOL {
        return daytime;
    }];
    
    
    describe(@"KSFSM", ^{
        
        describe(@"transition:", ^{

            it(@"handles an initial state", ^{
                expect(fsm.state).to.be(sleeping);
                    expect([KSHumanizer sentence:@[@"apple", @"lemon", @"peach"]]).to.equal(@"apple, lemon and peach");
                });
            });
        
        });
    
});

SpecEnd
