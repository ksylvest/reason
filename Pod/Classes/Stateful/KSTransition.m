//
//  KSTransition.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-07-31.
//
//

#import "KSTransition.h"
#import "KSState.h"

@interface KSTransition ()

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) KSState *from;
@property (nonatomic, strong) KSState *to;

@end

@implementation KSTransition

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Factories

+ (instancetype)named:(NSString *)name from:(KSState *)from to:(KSState *)to
{
    return [[self alloc] initWithName:name from:from to:to];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Lifecycle

- (id)initWithName:(NSString *)name from:(KSState *)from to:(KSState *)to
{
    self = [super init];
    
    if (self)
    {
        self.name = name;
        self.from = from;
        self.to = to;
    }
    
    return self;
}

@end
