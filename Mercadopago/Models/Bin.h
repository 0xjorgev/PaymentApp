//
//  Bin.h
//  Mercadopago
//
//  Created by Jorge Mendoza on 9/28/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Bin : NSObject

@property (nonatomic, retain)NSString * pattern;
@property (nonatomic, retain)NSString * installmentsPattern;
@property (nonatomic, retain)NSString * exclusionpattern;

-(instancetype)initWithExclution:(NSString *) pattern
                     installments:(NSString *) installment
                     exclusions:(NSString *) exclusions;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
