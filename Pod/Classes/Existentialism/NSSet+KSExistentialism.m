//
//  NSSet+KSExistentialism.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-19.
//
//

#import "NSSet+KSExistentialism.h"
#import "NSObject+KSExistentialism.h"

@implementation NSSet (KSExistentialism)

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Implementation

- (BOOL)ks_exists
{
    return [super ks_exists] && !!self.count;
}

@end
