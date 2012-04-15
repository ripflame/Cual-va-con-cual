//
//  Card.m
//  Cual va con cual
//
//  Created by Daniel Rueda Jimenez on 11/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Card.h"

@implementation Card
@synthesize value = _value;
@synthesize name = _name;

- (id)initWithName:(NSString *)name value:(NSNumber *)value
{
    self = [super init];
    if (self) {
        _name = [name copy];
        _value = [value copy];
    }
    return self;
}

- (id)initWithName:(NSString *)name
{
    return [self initWithName:name value:nil];
}

- (id)init
{
    return [self initWithName:nil];
}

+ (Card *)cardWithName:(NSString *)name
{
    return [[[Card alloc] initWithName:name] autorelease];
}

+ (Card *)cardWithName:(NSString *)name andValue:(NSNumber *)value
{
    return [[[Card alloc] initWithName:name value:value] autorelease];
}

- (void)dealloc
{
    [_name release];
    [_value release];
    [super dealloc];
}

#pragma mark - Helper methods
- (BOOL)isEqualValue:(Card *)card
{
    return [self.value isEqualToNumber:card.value];
}

@end
