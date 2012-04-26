//
//  GameOver.m
//  Cual va con cual
//
//  Created by Gilberto Leon on 25/04/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "GameOver.h"
#import "CreacionElementos.h"

@interface GameOver()
- (void)atras:(id)sender;
@end

@implementation GameOver
{
    CGSize size;
}

+ (CCScene *)scene
{
    // 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	GameOver *layer = [GameOver node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

- (id)init
{
    self = [super init];
    if (self) {
        size = [[CCDirector sharedDirector] winSize];
        CCSprite *bg = [CCSprite spriteWithFile:@"bg2.png"];
        bg.position = ccp(size.width/2, size.height/2);
        [self addChild:bg z:0];
        
        CCLabelTTF *titulo = [CCLabelTTF labelWithString:@"¡Ganaste!" fontName:@"futura" fontSize:40];
        titulo.position = ccp(size.width/2, size.height - titulo.contentSize.height);
        [self addChild:titulo z:1];
        
        CCLabelTTF *felicidades = [CCLabelTTF labelWithString:@"Haz encontrado todos los pares ¡Felicidades!" dimensions:CGSizeMake(400, 120) alignment:UITextAlignmentCenter fontName:@"futura" fontSize:25];
        felicidades.position = ccp(size.width/2, size.height/2);
        [self addChild:felicidades z:1];
        
        CCMenuItemLabel *atrasButton = [CCMenuItemLabel itemWithLabel:[CreacionElementos crearLabelConTexto:@"Atrás" tamano:32] target:self selector:@selector(atras:)];
        CCMenu *menu = [CCMenu menuWithItems:atrasButton, nil];
        menu.position = ccp(size.width/2, atrasButton.contentSize.height/2);
        [self addChild:menu z:1];
        
    }
    
    return self;
}

- (void)atras:(id)sender
{
    [[CCDirector sharedDirector] popScene];
}

@end
