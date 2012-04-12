//
//  NivelDos.m
//  Cual va con cual
//
//  Created by Gilberto Leon on 02/04/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "NivelDos.h"


@interface NivelDos()
- (void)atras:(id)sender;
- (void)crearSprites:(int)numero;
@end

@implementation NivelDos

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	NivelDos *layer = [NivelDos node];
	
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
        
        CCLabelTTF *titulo = [CCLabelTTF labelWithString:@"Nivel 2" fontName:@"Marker Felt" fontSize:40];
        titulo.position = ccp(size.width/2, size.height - titulo.contentSize.height);
        [self addChild:titulo z:1];
        
        CCMenuItemLabel *atrasButton = [CCMenuItemLabel itemWithLabel:[CreacionElementos crearLabelConTexto:@"Atrás" tamano:32] target:self selector:@selector(atras:)];
        CCMenu *menu = [CCMenu menuWithItems:atrasButton, nil];
        menu.position = ccp(size.width - atrasButton.contentSize.width/2, atrasButton.contentSize.height/2);
        [self addChild:menu z:1];
        
        [self crearSprites:6];
    }
    
    return self;
}

#pragma mark - Acciones

- (void)atras:(id)sender
{
    CCScene *scene = [Titulo scene];
    [[CCDirector sharedDirector] replaceScene:scene];
}

- (void)spriteSelected:(id)sender
{
    NSLog(@"seleccionado");
}

- (void)crearSprites:(int)numero
{
    CCMenuItemImage *imagenUno = [CCMenuItemImage itemFromNormalImage:@"fondo.png" selectedImage:@"fondo.png" target:self selector:@selector(spriteSelected:)];
    CCMenuItemImage *imagenDos = [CCMenuItemImage itemFromNormalImage:@"fondo.png" selectedImage:@"fondo.png" target:self selector:@selector(spriteSelected:)];
    CCMenu *menuUno = [CCMenu menuWithItems:imagenUno, nil];
    CCMenu *menuDos = [CCMenu menuWithItems:imagenDos, nil];
    
    for (int i = 1; i < numero/2; i++) {
        [menuUno addChild:[CCMenuItemImage itemFromNormalImage:@"fondo.png" selectedImage:@"fondo.png" target:self selector:@selector(spriteSelected:)]];
    }
    [menuUno alignItemsHorizontallyWithPadding:10];
    menuUno.position = ccp(size.width/2, size.height/2 + 40);
    [self addChild:menuUno];
    
    for (int i = 1; i < numero/2; i++) {
        [menuDos addChild:[CCMenuItemImage itemFromNormalImage:@"fondo.png" selectedImage:@"fondo.png" target:self selector:@selector(spriteSelected:)]];
    }
    [menuDos alignItemsHorizontallyWithPadding:10];
    menuDos.position = ccp(size.width/2, size.height/2 - 70);
    [self addChild:menuDos];
}

@end
