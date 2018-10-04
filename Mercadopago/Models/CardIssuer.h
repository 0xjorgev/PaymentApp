//
//  CardIssuer.h
//  Mercadopago
//
//  Created by Jorge Mendoza on 9/28/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CardIssuer : NSObject

@property (nonatomic, retain)NSString * issuerId;
@property (nonatomic, retain)NSString * name;
@property (nonatomic, retain)NSString * secureThumbnail;
@property (nonatomic, retain)NSString * thumbnail;
@property (nonatomic, retain)NSString * processingMode;
@property (nonatomic, retain)NSString * merchantAccountId;

- (instancetype)initWith:(NSDictionary *)dictionary;


@end

NS_ASSUME_NONNULL_END
