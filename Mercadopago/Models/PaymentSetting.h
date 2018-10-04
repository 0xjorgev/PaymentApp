//
//  PaymentSetting.h
//  Mercadopago
//
//  Created by Jorge Mendoza on 9/28/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CardNumber.h"
#import "Bin.h"
#import "SecurityCode.h"


NS_ASSUME_NONNULL_BEGIN

@interface PaymentSetting : NSObject

@property(nonatomic, retain) CardNumber * cardNumber;
@property(nonatomic, retain) Bin * bin;
@property(nonatomic, retain) SecurityCode * securityCode;

-(instancetype)initWith:(CardNumber *)cardNumber execution:(Bin *)bin security:(SecurityCode *)code;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;


@end

NS_ASSUME_NONNULL_END
