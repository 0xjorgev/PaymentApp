//
//  PayerCost.h
//  Mercadopago
//
//  Created by Jorge Mendoza on 9/30/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PayerCost : NSObject

@property (nonatomic, retain)NSString * installments;
@property (nonatomic, retain)NSString * installmentRate;
@property (nonatomic, retain)NSString * discountRate;
@property (nonatomic, retain)NSString * minAllowedAmount;
@property (nonatomic, retain)NSString * maxAllowedAmount;
@property (nonatomic, retain)NSString * installmentAmount;
@property (nonatomic, retain)NSString * totalAmount;
@property (nonatomic, retain)NSMutableArray * labels;
@property (nonatomic, retain)NSMutableArray * installmentRateCollector;
@property (nonatomic, retain)NSString * recommendedMessage;

-(instancetype)initWithDictionary:(NSDictionary *) dictionary;

@end

NS_ASSUME_NONNULL_END
