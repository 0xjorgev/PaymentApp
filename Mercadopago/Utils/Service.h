//
//  Service.h
//  Mercadopago
//
//  Created by Jorge Mendoza on 9/28/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Service : NSObject

typedef void (^completionHandler)( NSData * _Nullable data, NSURLResponse *response, NSError * _Nullable  error);

+(Service *)shared;

-(void)getPaymentMethods:(completionHandler)handler;
-(void)getAvailableBankForCard:(NSString * )cardId completion:(completionHandler)blockHandler;
-(void)getRecommendedMessage:(NSString * )amount with:(NSString *)paymentId with:(NSString *)issuerId completion:(completionHandler)blockHandler;

@end
