//
//  CreacionElementos.m
//  Cual va con cual
//
//  Created by Gilberto Leon on 02/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CreacionElementos.h"

@implementation CreacionElementos

+ (CCLabelTTF *)crearLabelConTexto:(NSString *)texto tamano:(int)tamano
{
    CCLabelTTF *label = [CCLabelTTF labelWithString:texto fontName:@"Marker Felt" fontSize:tamano];
    
    return label;
}

@end
