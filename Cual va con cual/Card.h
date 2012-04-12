//
//  Carta.h
//  Cual va con cual
//
//  Created by Gilberto Leon on 11/04/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Card : CCSprite

@property (nonatomic, assign) int num;

+ (id)cardWithFile:(NSString *)fileName;

@end
