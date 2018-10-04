//
//  ComposedTRX.m
//  Mercadopago
//
//  Created by Jorge Mendoza on 10/2/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import "ComposedTRX.h"

@implementation ComposedTRX

-(instancetype)initWith:(NSNumber * )amount payment:(PaymentMethod * _Nullable)method settings:(CardIssuer * _Nullable)issuer installment:(PayerCost * _Nullable)cost{
    self = [super init];
    if (self) {
        
        _amount = amount;
        _method = method;
        _cost   = cost;
        _issuer = issuer;
        
        
//        NSLog(@"Amount: %@", amount);
//        NSLog(@"Issuer name: %@", issuer.name);
    }
    return self;
}

@end
