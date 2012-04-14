//
//  LevelFactory.h
//  Cual va con cual
//
//  Created by Daniel Rueda Jimenez on 13/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface LevelFactory : CCLayer
{
    CGSize size;
    NSArray *cartas;
    CCMenu *menuUno;
    CCMenu *menuDos;
    int cartaUno;
    int cartaDos;
    
    int cartasVisibles;
    CCMenuItemImage *cartaAnterior;
    CCMenuItemImage *cartaAnteAnterior;
    
    int parejasEncontradas;
    
    int _level;
}

+(CCScene *) sceneForLevel:(NSInteger)level;

@end
