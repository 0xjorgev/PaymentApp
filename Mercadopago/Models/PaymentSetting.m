//
//  PaymentSetting.m
//  Mercadopago
//
//  Created by Jorge Mendoza on 9/28/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import "PaymentSetting.h"

@implementation PaymentSetting

-(instancetype)initWith:(CardNumber *)cardNumber execution:(Bin *)bin security:(SecurityCode *)code{
    self = [super init];
    if (self) {
        _cardNumber = cardNumber;
        _bin = bin;
        _securityCode = code;
    }
    return self;
}

-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if (self) {
        _cardNumber = [[CardNumber alloc] initWithDictionary:[dictionary objectForKey:@"card_number"]];
        _bin = [[Bin alloc] initWithDictionary:[dictionary objectForKey:@"bin"]];
        _securityCode = [[SecurityCode alloc] initWithDictionary:[dictionary objectForKey:@"security_code"]];
    }
    return self;
}

@end
