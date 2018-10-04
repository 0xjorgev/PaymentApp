//
//  Installments.h
//  Mercadopago
//
//  Created by Jorge Mendoza on 9/30/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CardIssuer.h"
#import "PayerCost.h"

NS_ASSUME_NONNULL_BEGIN

@interface Installments : NSObject

@property (nonatomic, retain) NSString * paymentMethodId;
@property (nonatomic, retain) NSString * paymentTypeId;
@property (nonatomic, retain) NSString * processingMode;
@property (nonatomic, retain) NSString * merchantAccountId;
@property (nonatomic, retain) CardIssuer * issuer;
@property (nonatomic, retain) NSMutableArray * payerCosts;

-(instancetype)initWith:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
