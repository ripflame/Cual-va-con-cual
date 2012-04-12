//
//  Carta.m
//  Cual va con cual
//
//  Created by Gilberto Leon on 11/04/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Card.h"


@implementation Card
@synthesize num = _num;

+ (id)cardWithFile:(NSString *)fileName
{
    Card *card = [[[super alloc] initWithFile:fileName] autorelease];
    
    if (card) {
        
    }
    
    return card;
}

@end
