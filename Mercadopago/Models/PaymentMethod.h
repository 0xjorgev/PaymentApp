//
//  PaymentMethod.h
//  Mercadopago
//
//  Created by Jorge Mendoza on 9/28/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PaymentSetting.h"

NS_ASSUME_NONNULL_BEGIN

@interface PaymentMethod : NSObject

@property (nonatomic, retain)NSString * paymentId;
@property (nonatomic, retain)NSNumber * minAllowedAmount;
@property (nonatomic, retain)NSNumber * maxAllowedAmount;
@property (nonatomic, retain)NSNumber * accreditationTime;
@property (nonatomic, retain)NSNumber * financialInstitutions;
@property (nonatomic, retain)NSString * name;
@property (nonatomic, retain)NSString * paymentTypeId;
@property (nonatomic, retain)NSString * status;
@property (nonatomic, retain)NSString * secureThumbnail;
@property (nonatomic, retain)NSString * thumbnail;
@property (nonatomic, retain)NSString * deferredCapture;
@property (nonatomic, retain)NSMutableArray * settings;
@property (nonatomic, retain)NSMutableArray * additionalInfoNeeded;
@property (nonatomic, retain)NSMutableArray * processingModes;

-(instancetype)initWithPayment:(NSString *) paymentId
                     minAmount:(NSNumber *) minAllowedAmount
                     maxAmount:(NSNumber *) maxAllowedAmount
                          time:(NSNumber *) accreditationTime
                   institution:(NSNumber *) financialInstitutions
                   paymentName:(NSString *) name
                        typeId:(NSString *) paymentTypeId
                            st:(NSString *) status
                        secure:(NSString *) secureThumbnail
                         thumb:(NSString *) thumbnail
                       capture:(NSString *) deferredCapture
                       setting:(NSMutableArray *) settings
                additionalInfo:(NSMutableArray *) additionalInfoNeeded
                         modes:(NSMutableArray *) processingModes;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
