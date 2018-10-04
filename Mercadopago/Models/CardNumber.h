//
//  CardNumber.h
//  Mercadopago
//
//  Created by Jorge Mendoza on 9/28/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CardNumber : NSObject

@property(nonatomic, retain)NSString * validation;
@property(nonatomic, retain)NSString * length;

-(instancetype)initWith:(NSString *)validation card:(NSString *)length;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
