//
//  NivelUno.m
//  Cual va con cual
//
//  Created by Gilberto Leon on 02/04/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "NivelUno.h"


@implementation NivelUno

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	NivelUno *layer = [NivelUno node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

@end
