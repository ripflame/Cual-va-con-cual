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
        
        CCLabelTTF *titulo = [CreacionElementos crearLabelConTexto:@"Selecciona una dificultad" tamano:40];
        titulo.position = ccp(size.width/2, size.height - titulo.contentSize.height);
        [self addChild:titulo z:1];
        
        [self crearMenu];
    }
    
    return self;
}

#pragma mark - Acciones

- (void)nivelUno:(id)sender
{
    NSLog(@"Nivel 1");
    /**
     HINT:
     Lo correcto es que tengas un CCScene para gestionar niveles
     Luego unicamente le pasas el nivel correspondiente, Ej.
     GameScene *gameScene = [GameScene scene];
     gameScene.level = [LevelFactory createLevel:kFirstLevel];
     **/
    CCScene *scene = [LevelFactory sceneForLevel:1];
    [[CCDirector sharedDirector] replaceScene:scene];
}

- (void)nivelDos:(id)sender
{
    NSLog(@"Nivel 2");
    
    CCScene *scene = [LevelFactory sceneForLevel:2];
    [[CCDirector sharedDirector] replaceScene:scene];
}

- (void)nivelTres:(id)sender
{
    NSLog(@"Nivel 3");
    
    CCScene *scene = [LevelFactory sceneForLevel:3];
    [[CCDirector sharedDirector] replaceScene:scene];
}

- (void)atras:(id)sender
{
    NSLog(@"Atrás");
    
    CCScene *scene = [Titulo scene];
    [[CCDirector sharedDirector] replaceScene:scene];
}

#pragma mark - Creación de elementos

- (void)crearMenu 
{
    CCMenuItemLabel *nivelUnoButton = [CCMenuItemLabel itemWithLabel:[CreacionElementos crearLabelConTexto:@"Nivel 1" tamano:32] target:self selector:@selector(nivelUno:)];
    
    CCMenuItemLabel *nivelDosButton = [CCMenuItemLabel itemWithLabel:[CreacionElementos crearLabelConTexto:@"Nivel 2" tamano:32] target:self selector:@selector(nivelDos:)];
    
    CCMenuItemLabel *nivelTresButton = [CCMenuItemLabel itemWithLabel:[CreacionElementos crearLabelConTexto:@"Nivel 3" tamano:32] target:self selector:@selector(nivelTres:)];
    
    CCMenuItemLabel *atrasButton = [CCMenuItemLabel itemWithLabel:[CreacionElementos crearLabelConTexto:@"Atrás" tamano:32] target:self selector:@selector(atras:)];
    
    CCMenu *atrasButtonMenu = [CCMenu menuWithItems:atrasButton, nil];
    atrasButtonMenu.position = ccp(size.width - atrasButton.contentSize.width, atrasButton.contentSize.height);
    [self addChild:atrasButtonMenu z:1];
    
    CCMenu *menu = [CCMenu menuWithItems:nivelUnoButton, nivelDosButton, nivelTresButton, nil];
    [menu alignItemsVerticallyWithPadding:10];
    menu.position = ccp(size.width/2, size.height/2);
    [self addChild:menu z:1];
}

@end
