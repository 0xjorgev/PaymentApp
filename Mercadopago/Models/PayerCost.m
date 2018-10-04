//
//  PaymentCost.m
//  Mercadopago
//
//  Created by Jorge Mendoza on 9/30/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import "PayerCost.h"

@implementation PayerCost

-(instancetype)initWithDictionary:(NSDictionary *) dictionary{
    self = [super init];
    if (self) {
        
        //NSLog(@"Dictionary Payer: %@", dictionary);
        //NSLog(@"payment_method_id: %@", [dictionary valueForKey:@"installments"]);
        
        NSMutableArray * rateCollectors = [[NSMutableArray alloc]init];
        
        NSMutableArray * labels = [[NSMutableArray alloc]init];
        
        for (NSString * item in [dictionary valueForKey:@"installment_rate_collector"]){
            
            [rateCollectors addObject:item];
        }
        
        //NSLog(@"rates: %@", rateCollectors);
        
        for (NSString * item in [dictionary valueForKey:@"labels"]){
            
            [labels addObject:item];
        }
        
        //NSLog(@"labels: %@", labels);
        
        _installments = [dictionary valueForKey:@"installments"];
        _installmentRate = [dictionary valueForKey:@"installment_rate"];
        _discountRate = [dictionary valueForKey:@"discount_rate"];
        _minAllowedAmount = [dictionary valueForKey:@"min_allowed_amount"];
        _maxAllowedAmount = [dictionary valueForKey:@"max_allowed_amount"];
        _installmentAmount = [dictionary valueForKey:@"installment_amount"];
        _totalAmount = [dictionary valueForKey:@"total_amount"];
        _labels = labels;
        _installmentRateCollector = rateCollectors;
        _recommendedMessage = [dictionary objectForKey:@"recommended_message"];
    }
    return self;
}

@end
