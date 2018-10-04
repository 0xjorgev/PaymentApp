//
//  Service.m
//  Mercadopago
//
//  Created by Jorge Mendoza on 9/28/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import "Service.h"

@implementation Service

static Service * shared = nil;

NSString *const HTTP = @"https://api.mercadopago.com/v1/";
NSString *const APIKEY = @"444a9ef5-8a6b-429f-abdf-587639155d88";

+ (Service *)shared {
    if (shared == nil) {
        shared = [[Service alloc] init];
    }
    return shared;
}

- (id)init {
    if ( (self = [super init]) ) {
    }
    return self;
}

-(void)getRequest:(NSString *)baseUrl completion:(completionHandler)handler {
    
    NSURL *url = [NSURL URLWithString:baseUrl];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    
    [request setURL:url];
    
    [request setHTTPMethod:@"GET"];
    
    NSURLSessionDataTask * task =
    
    [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * data, NSURLResponse * response, NSError * error){
        
        handler(data,response,error);
    }];
    
    [task resume];
    
}

-(void)getPaymentMethods:(completionHandler)blockHandler{
    
    //https://api.mercadopago.com/v1/payment_methods?public_key=444a9ef5-8a6b-429f-abdf-587639155d88
    
    NSString * fullURL = [NSString stringWithFormat: @"%@payment_methods?public_key=%@",HTTP, APIKEY];
    
    [self getRequest:fullURL completion:^(NSData * data, NSURLResponse * response, NSError * error){
        
        if (error == nil) {
            blockHandler(data, response, nil);
        } else {
            blockHandler(nil, response, error);
        }
    }];
}

-(void)getAvailableBankForCard:(NSString * )cardId completion:(completionHandler)blockHandler{
    
    //https://api.mercadopago.com/v1/payment_methods/card_issuers?public_key=444a9ef5-8a6b-429f-abdf-587639155d88&payment_method_id=visa
    NSString * fullURL = [NSString stringWithFormat: @"%@payment_methods/card_issuers?public_key=%@&payment_method_id=%@",HTTP, APIKEY, cardId];
    
    [self getRequest:fullURL completion:^(NSData * data, NSURLResponse * response, NSError * error){
        //blockHandler(data, response, error);
        
        if (error == nil) {
            blockHandler(data, response, nil);
        } else {
            blockHandler(nil, response, error);
        }
        
    }];
}

-(void)getRecommendedMessage:(NSString * )amount with:(NSString *)paymentId with:(NSString *)issuerId completion:(completionHandler)blockHandler{
    
    //https://api.mercadopago.com/v1/payment_methods/installments?public_key=444a9ef5-8a6b-429f-abdf-587639155d88&amount=1200&payment_method_id=visa&issuer.id=12350
    
    NSString * fullURL = [NSString stringWithFormat: @"%@payment_methods/installments?public_key=%@&amount=%@&&payment_method_id=%@&issuer.id=%@",HTTP, APIKEY, amount, paymentId, issuerId];
    
    [self getRequest:fullURL completion:^(NSData * data, NSURLResponse * response, NSError * error){
       // blockHandler(data, response, error);
        
        if (error == nil) {
            blockHandler(data, response, nil);
        } else {
            blockHandler(nil, response, error);
        }
        
    }];
}



@end
