//
//  ComposedTRX.h
//  Mercadopago
//
//  Created by Jorge Mendoza on 10/2/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PaymentMethod.h"
#import "PayerCost.h"
#import "CardIssuer.h"

NS_ASSUME_NONNULL_BEGIN

@interface ComposedTRX : NSObject

@property(nonatomic, retain) NSNumber * amount;
@property(nonatomic, retain) PaymentMethod * method;
@property(nonatomic, retain) CardIssuer * issuer;
@property(nonatomic, retain) PayerCost * cost;

-(instancetype)initWith:(NSNumber * )amount payment:(PaymentMethod * _Nullable)method settings:(CardIssuer * _Nullable)issuer installment:(PayerCost * _Nullable)cost;

@end

NS_ASSUME_NONNULL_END
