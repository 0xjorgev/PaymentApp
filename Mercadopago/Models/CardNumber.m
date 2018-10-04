//
//  CardNumber.m
//  Mercadopago
//
//  Created by Jorge Mendoza on 9/28/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import "CardNumber.h"

@implementation CardNumber

-(instancetype)initWith:(NSString *)validation card:(NSString *)length{
    self = [super init];
    if (self) {
        _validation = validation;
        _length = length;
    }
    return self;
}

-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if (self) {
        _validation = [dictionary valueForKey:@"validation"];
        _length = [dictionary valueForKey:@"length"];
    }
    return self;
}

@end
