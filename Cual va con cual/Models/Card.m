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

- (id)init
{
    return [self initWithName:nil];
}

- (id)initWithName:(NSString *)name
{
    return [self initWithName:name value:nil];
}

- (id)initWithName:(NSString *)name value:(NSNumber *)value
{
    self = [super init];
    if (self) {
        // No es obligatorio, pero es recomendado inicializar ivars
        _name = [name copy];
        _value = [value copy];
    }
    return self;
}

+ (Card *)cardWithName:(NSString *)name
{
    return [[Card alloc] initWithName:name];
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
