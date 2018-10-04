//
//  NSString+NumberFromString.m
//  Mercadopago
//
//  Created by Jorge Mendoza on 10/4/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import "NSString+NumberFromString.h"

@implementation NSString (NumberFromString)

-(NSNumber *)toNumber{
    
    NSNumberFormatter * formater = [[NSNumberFormatter alloc]init];
    
    return [NSNumber numberWithDouble:[[formater numberFromString:self] doubleValue]];
}

@end
