//
//  NSSet+KSParser.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-12.
//
//

#import "NSSet+KSParser.h"
#import "NSObject+KSParser.h"

@implementation NSSet (KSParser)

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Parsing

+ (NSArray *)KS_parse:(id)object
{
    object = [super KS_parse:object];
    if (!object || [object isKindOfClass:[NSSet class]]) return object;
    return NULL;
}

@end
