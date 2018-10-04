//
//  CardTableViewCell.h
//  Mercadopago
//
//  Created by Jorge Mendoza on 10/1/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "PureLayout.h"
#import "PaymentMethod.h"
#import "ComposedTRX.h"

@interface CardTableViewCell : UITableViewCell

@property(nonatomic, retain) UIImageView * thumbnail;
@property(nonatomic, retain) UIImageView * selectedCard;
@property(nonatomic, retain) UILabel * cardnameLabel;
//@property(nonatomic, retain) PaymentMethod * card;
//@property(nonatomic, retain) ComposedTRX * trx;

-(void)createViews;
-(void)setPaymentMethod:(PaymentMethod *)card;
-(void)setIssuerData:(CardIssuer *)issuer;

@end
