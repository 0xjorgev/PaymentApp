//
//  PaymentMethod.m
//  Mercadopago
//
//  Created by Jorge Mendoza on 9/28/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import "PaymentMethod.h"

@implementation PaymentMethod

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
                         modes:(NSMutableArray *) processingModes{
    
    self = [super init];
    if (self) {
        _paymentId = paymentId;
        _minAllowedAmount = minAllowedAmount;
        _maxAllowedAmount = maxAllowedAmount;
        _accreditationTime = accreditationTime;
        _financialInstitutions = financialInstitutions;
        _name = name;
        _paymentTypeId = paymentTypeId;
        _status = status;
        _secureThumbnail = secureThumbnail;
        _thumbnail = thumbnail;
        _deferredCapture = deferredCapture;
        _settings = settings;
        _additionalInfoNeeded = additionalInfoNeeded;
        _processingModes = processingModes;
    }
    return self;
    
}

-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    
    self = [super init];
    if (self) {
        
        NSMutableArray * setupArr = [dictionary objectForKey:@"settings"];
        
        NSMutableArray * additionalInfo = [[NSMutableArray alloc] init];
        
        NSMutableArray * settingsArr = [[NSMutableArray alloc]init];
        
        NSMutableArray * arr = [[NSMutableArray alloc] init];
        
        for (NSDictionary * setupDict in setupArr) {
            
            PaymentSetting * setup = [[PaymentSetting alloc]initWithDictionary:setupDict];
            
            [settingsArr addObject:setup];
        }
        
        for (NSString * inner in [dictionary objectForKey:@"additional_info_needed"]){
            [additionalInfo addObject:inner];
        }
        
        _paymentId = [dictionary objectForKey:@"id"];
        _minAllowedAmount = [dictionary valueForKey:@"min_allowed_amount"];
        _maxAllowedAmount = [dictionary valueForKey:@"max_allowed_amount"];
        _accreditationTime = [dictionary valueForKey:@"accreditation_time"];
        _financialInstitutions = [dictionary objectForKey:@"financial_institutions"];
        _name = [dictionary objectForKey:@"name"];
        _paymentTypeId = [dictionary objectForKey:@"payment_type_id"];
        _status = [dictionary objectForKey:@"status"];
        _secureThumbnail = [dictionary objectForKey:@"secure_thumbnail"];
        _thumbnail = [dictionary objectForKey:@"thumbnail"];
        _deferredCapture = [dictionary objectForKey:@"deferred_capture"];
        _settings = settingsArr;
        _additionalInfoNeeded = additionalInfo;
        _processingModes = arr;
    }
    return self;
    
}

@end
