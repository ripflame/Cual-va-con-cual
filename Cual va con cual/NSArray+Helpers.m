//
//  NSArray+Helpers.m
//  Cual va con cual
//
//  Created by Gilberto Leon on 04/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSArray+Helpers.h"

@implementation NSArray (Helpers)

- (NSArray *)shuffled
{
    NSMutableArray *tmpArray = [NSMutableArray arrayWithCapacity:self.count];
    
    for (id anObject in self) {
        NSUInteger randomPos = arc4random() % (tmpArray.count + 1);
        [tmpArray insertObject:anObject atIndex:randomPos];
    }
    
    return tmpArray;
}

@end
