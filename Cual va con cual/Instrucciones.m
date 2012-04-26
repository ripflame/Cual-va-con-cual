//
//  Instrucciones.m
//  Cual va con cual
//
//  Created by Gilberto Leon on 02/04/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Instrucciones.h"


@implementation Instrucciones

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	Instrucciones *layer = [Instrucciones node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

- (void)atras:(id)sender
{
    [[CCDirector sharedDirector] popScene];
}

- (id)init
{
    self = [super init];
    if (self) {
        size = [[CCDirector sharedDirector] winSize];
        
        CCSprite *bg = [CCSprite spriteWithFile:@"bg3.png"];
        bg.position = ccp(size.width/2, size.height/2);
        [self addChild:bg z:0];
        
        CCLabelTTF *titulo = [CreacionElementos crearLabelConTexto:@"Instrucciones" tamano:40];
        titulo.position = ccp(size.width/2, size.height - titulo.contentSize.height);
        [self addChild:titulo z:1];
        
        CCLabelTTF *instrucciones = [CCLabelTTF labelWithString:@"Para ganar tienes que encontrar todos los pares de cartas por ejemplo:" dimensions:CGSizeMake(400, 130) alignment:UITextAlignmentCenter fontName:@"Futura" fontSize:19];
        instrucciones.position = ccp(size.width/2, size.height/2);
        [self addChild:instrucciones z:1];
        
        CCSprite *cartaUno = [CCSprite spriteWithFile:@"carta1.png"];
        cartaUno.position = ccp(size.width/2 - 90, size.height/2 - 50);
        [self addChild:cartaUno z:1];
        CCSprite *cartaUnoA = [CCSprite spriteWithFile:@"carta1a.png"];
        cartaUnoA.position = ccp(size.width/2 + 90, size.height/2 - 50);
        [self addChild:cartaUnoA z:1];
        
        CCMenuItemLabel *atrasButton = [CCMenuItemLabel itemWithLabel:[CreacionElementos crearLabelConTexto:@"Atrás" tamano:32] target:self selector:@selector(atras:)];
        CCMenu *menu = [CCMenu menuWithItems:atrasButton, nil];
        menu.position = ccp(atrasButton.contentSize.width, atrasButton.contentSize.height/2);
        [self addChild:menu z:1];
    }
    
    return self;
}

@end
