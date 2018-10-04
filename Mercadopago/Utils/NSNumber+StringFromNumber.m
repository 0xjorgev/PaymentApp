//
//  NSNumber+StringFromNumber.m
//  Mercadopago
//
//  Created by Jorge Mendoza on 10/3/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import "NSNumber+StringFromNumber.h"

@implementation NSNumber (StringFromNumber)

-(NSString *)toString{
    return [NSString stringWithFormat:@"%@", self];
}

@end
