//
//  Bin.m
//  Mercadopago
//
//  Created by Jorge Mendoza on 9/28/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import "Bin.h"

@implementation Bin

-(instancetype)initWithExclution:(NSString *) pattern
                    installments:(NSString *) installment
                      exclusions:(NSString *) exclusions{
    self = [super init];
    if (self) {
        _pattern = pattern;
        _installmentsPattern = installment;
        _exclusionpattern = exclusions;
    }
    return self;
}

-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if (self) {
        
        _pattern = [dictionary objectForKey:@"pattern"];
        _installmentsPattern = [dictionary objectForKey:@"installments_pattern"];
        _exclusionpattern = [dictionary objectForKey:@"exclusion_pattern"];
    }
    return self;
}

@end
