//
//  Titulo.m
//  Cual va con cual
//
//  Created by Gilberto Leon on 02/04/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Titulo.h"

@interface Titulo()
- (void)crearMenu;
@end

@implementation Titulo

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	Titulo *layer = [Titulo node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

- (id)init {
    self = [super init];
    if (self) {
        size = [[CCDirector sharedDirector] winSize];
        
        CCLabelTTF *titulo = [CreacionElementos crearLabelConTexto:@"¿Cuál va con cuál?" tamano:40];
        titulo.position = ccp(size.width/2, size.height - titulo.contentSize.height);
        [self addChild:titulo z:1];
        
        [self crearMenu];
    }
    
    return self;
}

#pragma mark - Acciones

- (void)dificultad:(id)sender
{
    NSLog(@"dificultad");
    
    CCScene *scene = [Dificultad scene];
    [[CCDirector sharedDirector] replaceScene:scene];
}

- (void)instrucciones:(id)sender
{
    NSLog(@"instrucciones");
    
    CCScene *scene = [Instrucciones scene];
    [[CCDirector sharedDirector] replaceScene:scene];
}

#pragma mark - Creación de elementos

- (void)crearMenu 
{
    int tamanoLetra = 32;
    
    CCMenuItemLabel *dificultadButton = [CCMenuItemLabel itemWithLabel:[CreacionElementos crearLabelConTexto:@"Dificultad" tamano:tamanoLetra] target:self selector:@selector(dificultad:)];
    
    CCMenuItemLabel *instruccionesButton = [CCMenuItemLabel itemWithLabel:[CreacionElementos crearLabelConTexto:@"Instrucciones" tamano:tamanoLetra] target:self selector:@selector(instrucciones:)];
    
    CCMenu *menu = [CCMenu menuWithItems:dificultadButton, instruccionesButton, nil];
    [menu alignItemsVerticallyWithPadding:10];
    menu.position = ccp(size.width/2, size.height/2);
    
    [self addChild:menu z:1];
}

@end
