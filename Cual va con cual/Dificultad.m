//
//  Dificultad.m
//  Cual va con cual
//
//  Created by Gilberto Leon on 02/04/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Dificultad.h"
#import "LevelFactory.h"

@interface Dificultad()
- (void)crearMenu;
@end

@implementation Dificultad

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	Dificultad *layer = [Dificultad node];
	
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
        
        CCLabelTTF *titulo = [CreacionElementos crearLabelConTexto:@"Selecciona una dificultad" tamano:40];
        titulo.position = ccp(size.width/2, size.height - titulo.contentSize.height);
        [self addChild:titulo z:1];
        
        [self crearMenu];
    }
    
    return self;
}

#pragma mark - Acciones

- (void)loadLevel:(kGameLevel)level
{
    CCScene *scene = [LevelFactory sceneForLevel:level];
    [[CCDirector sharedDirector] pushScene:scene];
}

- (void)nivelUno:(id)sender
{
    NSLog(@"Nivel 1");
    [self loadLevel:kFirstLevel];
}

- (void)nivelDos:(id)sender
{
    NSLog(@"Nivel 2");
    [self loadLevel:kSecondLevel];
}

- (void)nivelTres:(id)sender
{
    NSLog(@"Nivel 3");
    [self loadLevel:kThirdLevel];
}

- (void)atras:(id)sender
{
    NSLog(@"Atrás");
    [[CCDirector sharedDirector] popScene];
    //CCScene *scene = [Titulo scene];
    //[[CCDirector sharedDirector] replaceScene:scene];
}

#pragma mark - Creación de elementos

- (void)crearMenu 
{
    CCMenuItemLabel *nivelUnoButton = [CCMenuItemLabel itemWithLabel:[CreacionElementos crearLabelConTexto:@"Nivel 1" tamano:32] target:self selector:@selector(nivelUno:)];
    
    CCMenuItemLabel *nivelDosButton = [CCMenuItemLabel itemWithLabel:[CreacionElementos crearLabelConTexto:@"Nivel 2" tamano:32] target:self selector:@selector(nivelDos:)];
    
    CCMenuItemLabel *nivelTresButton = [CCMenuItemLabel itemWithLabel:[CreacionElementos crearLabelConTexto:@"Nivel 3" tamano:32] target:self selector:@selector(nivelTres:)];
    
    CCMenuItemLabel *atrasButton = [CCMenuItemLabel itemWithLabel:[CreacionElementos crearLabelConTexto:@"Atrás" tamano:32] target:self selector:@selector(atras:)];
    
    CCMenu *atrasButtonMenu = [CCMenu menuWithItems:atrasButton, nil];
    atrasButtonMenu.position = ccp(atrasButton.contentSize.width, atrasButton.contentSize.height);
    [self addChild:atrasButtonMenu z:1];
    
    CCMenu *menu = [CCMenu menuWithItems:nivelUnoButton, nivelDosButton, nivelTresButton, nil];
    [menu alignItemsVerticallyWithPadding:10];
    menu.position = ccp(size.width/2, size.height/2);
    [self addChild:menu z:1];
}

@end
