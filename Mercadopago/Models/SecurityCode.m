//
//  SecurityCode.m
//  Mercadopago
//
//  Created by Jorge Mendoza on 9/28/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import "SecurityCode.h"

@implementation SecurityCode

-(instancetype)initWithCard:(NSString *) location
                       card:(NSString *) mode
                     number:(NSString *) length{
    self = [super init];
    if (self) {
        _cardLocation = location;
        _mode = mode;
        _length = length;
    }
    return self;
}

-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if (self) {
        
        _cardLocation = [dictionary valueForKey:@"card_location"];
        _mode = [dictionary valueForKey:@"mode"];
        _length = [dictionary valueForKey:@"length"];
    }
    return self;
}

@end
