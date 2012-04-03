//
//  Titulo.m
//  Cual va con cual
//
//  Created by Gilberto Leon on 02/04/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Titulo.h"

@interface Titulo()
- (CCLabelTTF *)crearLabelConTexto:(NSString *)texto yTamano:(int)tamano;
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
        
        CCLabelTTF *titulo = [self crearLabelConTexto:@"¿Cuál va con cuál?" yTamano:40];
        titulo.position = ccp(size.width/2, size.height - titulo.contentSize.height);
        
        [self crearMenu];
        
        [self addChild:titulo z:1];
    }
    
    return self;
}

#pragma mark - Acciones

- (void)empezar
{
    NSLog(@"empezar");
}

- (void)dificultad
{
    NSLog(@"dificultad");
}

- (void)instrucciones
{
    NSLog(@"instrucciones");
}

#pragma mark - Creación de elementos

- (void)crearMenu 
{
    int tamanoLetra = 32;
    
    CCMenuItemLabel *empezarButton = [CCMenuItemLabel itemWithLabel:[self crearLabelConTexto:@"Empezar" yTamano:tamanoLetra] target:self selector:@selector(empezar)];
    
    CCMenuItemLabel *dificultadButton = [CCMenuItemLabel itemWithLabel:[self crearLabelConTexto:@"Dificultad" yTamano:tamanoLetra] target:self selector:@selector(dificultad)];
    
    CCMenuItemLabel *instruccionesButton = [CCMenuItemLabel itemWithLabel:[self crearLabelConTexto:@"Instrucciones" yTamano:tamanoLetra] target:self selector:@selector(instrucciones)];
    
    CCMenu *menu = [CCMenu menuWithItems:empezarButton, dificultadButton, instruccionesButton, nil];
    [menu alignItemsVerticallyWithPadding:10];
    menu.position = ccp(size.width/2, size.height/2);
    
    [self addChild:menu z:1];
}

- (CCLabelTTF *)crearLabelConTexto:(NSString *)texto yTamano:(int)tamano
{
    CCLabelTTF *label = [CCLabelTTF labelWithString:texto fontName:@"Marker Felt" fontSize:tamano];
    
    return label;
}

@end
