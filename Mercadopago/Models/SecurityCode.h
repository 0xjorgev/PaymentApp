//
//  SecurityCode.h
//  Mercadopago
//
//  Created by Jorge Mendoza on 9/28/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SecurityCode : NSObject

@property (nonatomic, retain)NSString * cardLocation;
@property (nonatomic, retain)NSString * mode;
@property (nonatomic, retain)NSString * length;

-(instancetype)initWithCard:(NSString *) location
                    card:(NSString *) mode
                    number:(NSString *) length;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;


@end

NS_ASSUME_NONNULL_END
