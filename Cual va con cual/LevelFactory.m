//
//  LevelFactory.m
//  Cual va con cual
//
//  Created by Daniel Rueda Jimenez on 13/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LevelFactory.h"
#import "CreacionElementos.h"
#import "Card.h"
#import "NSArray+Helpers.h"
#import "Titulo.h"

@interface LevelFactory()
@end

@implementation LevelFactory

+(CCScene *) sceneForLevel:(NSInteger)level
{
	CCScene *scene = [CCScene node];
	
	LevelFactory *layer = [[[LevelFactory alloc] initWithLevel:level] autorelease];
	
	[scene addChild: layer];
	
	return scene;
}

- (id)initWithLevel:(NSInteger)level
{
    self = [super init];
    if (self) {
        _level = level;
        
        size = [CCDirector sharedDirector].winSize;
        NSString *title = [NSString stringWithFormat:@"Nivel %d", level];
        
        CCLabelTTF *titulo = [CCLabelTTF labelWithString:title fontName:@"Marker Felt" fontSize:40];
        titulo.position = ccp(size.width/2, size.height - titulo.contentSize.height);
        [self addChild:titulo z:1];
        
        CCMenuItemLabel *atrasButton = [CCMenuItemLabel itemWithLabel:[CreacionElementos crearLabelConTexto:@"Atrás" tamano:32] target:self selector:@selector(atras:)];
        CCMenu *menu = [CCMenu menuWithItems:atrasButton, nil];
        menu.position = ccp(atrasButton.contentSize.width/2, atrasButton.contentSize.height/2);
        [self addChild:menu z:1];
        
        cartasVisibles = 0;
        parejasEncontradas = 0;
        
        NSUInteger cards = 2 + _level*2;
        
        [self escogerCartas:cards];
        [self crearSprites:cards];
    }
    return self;
}

#pragma mark - Acciones

- (void)escogerCartas:(NSUInteger)cantidad
{    
    /**
     HINT:
     Si sabes que el objeto debe ser autorelease, usa los metodos de conveniencia
     En vez de [[[NSMutableArray alloc] init] autorelease];
     Utiliza [NSMutableArray array];
     **/
    NSMutableArray *tmpArray = [NSMutableArray array];
    
    int randomNum;
    
    for (int i = 0; i < cantidad/2; i++) {
        randomNum = (arc4random() % 5)+1;
        Card *card = [Card cardWithName:[NSString stringWithFormat:@"carta%da.png", randomNum] 
                               andValue:[NSNumber numberWithInt:randomNum]];
        [tmpArray addObject:card];
        [tmpArray addObject:card];
    }
    
    // El metodo 'shuffled' es de instancia, en vez de
    // cartas = [[NSArray arrayWithArray:tmpArray] shuffled];
    // podias hacer esto:
    cartas = [tmpArray shuffled];
    [cartas retain];
}

- (void)atras:(id)sender
{
    CCScene *scene = [Titulo scene];
    [[CCDirector sharedDirector] replaceScene:scene];
}

- (void)spriteSelected:(CCMenuItemImage *)sender
{
    NSLog(@"seleccionado %d", sender.tag);
    
    Card *currentCard = [cartas objectAtIndex:sender.tag];
    Card *previousCard = [cartas objectAtIndex:cartaAnterior.tag];
    
    if (cartasVisibles == 2) {
        cartaAnterior.normalImage = [CCSprite spriteWithFile:@"fondo.png"];
        cartaAnterior.selectedImage = [CCSprite spriteWithFile:@"fondo.png"];
        cartaAnteAnterior.normalImage = [CCSprite spriteWithFile:@"fondo.png"];
        cartaAnteAnterior.selectedImage = [CCSprite spriteWithFile:@"fondo.png"];
        
        sender.normalImage = [CCSprite spriteWithFile:currentCard.name];
        sender.selectedImage = [CCSprite spriteWithFile:currentCard.name];
        
        cartaAnterior = sender;
        cartasVisibles = 1;
    } else if (cartasVisibles == 1) {
        if ([currentCard isEqualValue:previousCard]) {
            sender.normalImage = [CCSprite spriteWithFile:currentCard.name];
            sender.selectedImage = [CCSprite spriteWithFile:currentCard.name];
            [sender setIsEnabled:NO];
            [cartaAnterior setIsEnabled:NO];
            cartasVisibles = 0;
            parejasEncontradas++;
            if (parejasEncontradas >= cartas.count/2) {
                [self performSelector:@selector(mostrarBotonReset:)];
            }
        } else {
            sender.normalImage = [CCSprite spriteWithFile:currentCard.name];
            sender.selectedImage = [CCSprite spriteWithFile:currentCard.name];
            cartaAnteAnterior = cartaAnterior;
            cartaAnterior = sender;
            cartasVisibles = 2;
        }
    } else {
        sender.normalImage = [CCSprite spriteWithFile:currentCard.name];
        sender.selectedImage = [CCSprite spriteWithFile:currentCard.name];
        cartaAnterior = sender;
        cartasVisibles = 1;
    }
}

- (void)mostrarBotonReset:(id)sender
{
    CCMenuItemLabel *otroJuegoButton = [CCMenuItemLabel itemWithLabel:[CreacionElementos crearLabelConTexto:@"Otro Juego" tamano:32] target:self selector:@selector(reset:)];
    CCMenu *menu = [CCMenu menuWithItems:otroJuegoButton, nil];
    menu.position = ccp(size.width - otroJuegoButton.contentSize.width/2, otroJuegoButton.contentSize.height/2);
    [self addChild:menu z:1 tag:100];
}

- (void)reset:(id)sender
{
    [self removeChildByTag:100 cleanup:YES];
    parejasEncontradas = 0;
    [self escogerCartas:cartas.count];
    [self crearSprites:cartas.count];
}

- (void)crearSprites:(int)numero
{
    menuUno = [CCMenu menuWithItems:nil];
    menuDos = [CCMenu menuWithItems:nil];
    
    for (int i = 0; i < numero/2; i++) {
        [menuUno addChild:[CCMenuItemImage itemFromNormalImage:@"fondo.png" selectedImage:@"fondo.png" target:self selector:@selector(spriteSelected:)] z:1 tag:i];
    }
    [menuUno alignItemsHorizontallyWithPadding:10];
    menuUno.position = ccp(size.width/2, size.height/2 + 40);
    [self addChild:menuUno];
    
    for (int i = numero/2; i < numero; i++) {
        [menuDos addChild:[CCMenuItemImage itemFromNormalImage:@"fondo.png" selectedImage:@"fondo.png" target:self selector:@selector(spriteSelected:)] z:1 tag:i];
    }
    [menuDos alignItemsHorizontallyWithPadding:10];
    menuDos.position = ccp(size.width/2, size.height/2 - 70);
    [self addChild:menuDos];
}

@end
