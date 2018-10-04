//
//  Installments.m
//  Mercadopago
//
//  Created by Jorge Mendoza on 9/30/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import "Installments.h"


@implementation Installments


-(instancetype)initWith:(NSDictionary *)dictionary{
   
    self = [super init];
    
    if (self) {
        
        NSMutableArray * costs = [[NSMutableArray alloc]init];
        
        NSDictionary * issuerDict = [dictionary valueForKey:@"issuer"];
        
        for (NSDictionary * item in [[dictionary valueForKey:@"payer_costs"] objectAtIndex:0]){
            
            PayerCost * cost = [[PayerCost alloc]initWithDictionary:item];
            
            [costs addObject:cost];
        }
        
        _paymentMethodId = [dictionary valueForKey:@"payment_method_id"];
        _paymentTypeId = [dictionary valueForKey:@"payment_type_id"];
        _processingMode = [dictionary valueForKey:@"processing_mode"];
        _merchantAccountId = [dictionary valueForKey:@"merchant_account_id"];
        _issuer = [[CardIssuer alloc] initWith:issuerDict];
        _payerCosts = costs;
    }
    return self;
}

@end
