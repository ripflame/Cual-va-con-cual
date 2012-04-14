//
//  NSArray+Helpers.m
//  Cual va con cual
//
//  Created by Gilberto Leon on 04/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSArray+Helpers.h"

@implementation NSArray (Helpers)

- (NSArray *)shuffled
{
    NSMutableArray *tmpArray = [NSMutableArray arrayWithCapacity:self.count];
    
    for (id anObject in self) {
        /*
         DUDA
         Ej. Arreglo de 4 elementos, se ejecuta shuffled y randomPos arroja
         1, 2, 2, 1
         ¿Qué pasa con 3 y 4?
         ¿Qué pasa si randomPos se repite durante el ciclo?
         ¿Cómo aseguras que no pierda ningún elemento?
         */
        NSUInteger randomPos = arc4random() % (tmpArray.count + 1);
        [tmpArray insertObject:anObject atIndex:randomPos];
    }
    
    // Por herencia puedes retornar el objeto de la misma clase :P
    return tmpArray;//[NSArray arrayWithArray:tmpArray];
}

@end
