//
//  CardIssuer.m
//  Mercadopago
//
//  Created by Jorge Mendoza on 9/28/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import "CardIssuer.h"

@implementation CardIssuer

- (instancetype)initWith:(NSDictionary *)dictionary{
    
    self = [super init];
    if (self) {
        
        _issuerId = [dictionary valueForKey:@"id"] ;
        _name = [dictionary valueForKey:@"name"];
        _secureThumbnail = [dictionary valueForKey:@"secure_thumbnail"];
        _thumbnail = [dictionary valueForKey:@"thumbnail"];
        _processingMode = [dictionary valueForKey:@"processing_mode"];
        _merchantAccountId  = [dictionary valueForKey:@"merchant_account_id"];
    }
    return self;
    
}
@end
