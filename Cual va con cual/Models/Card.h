//
//  Card.h
//  Cual va con cual
//
//  Created by Daniel Rueda Jimenez on 11/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (nonatomic, retain) NSNumber *value;
@property (nonatomic, retain) NSString *name;

+ (Card *)cardWithName:(NSString *)name;

- (BOOL)isEqualValue:(Card *)card;

@end
