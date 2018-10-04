//
//  PaymentAmountTableViewCell.h
//  Mercadopago
//
//  Created by Jorge Mendoza on 10/1/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PureLayout.h"

NS_ASSUME_NONNULL_BEGIN

@interface PaymentAmountTableViewCell : UITableViewCell

@property(nonatomic, retain)UITextField * amountField;
@property(nonatomic, retain)UILabel * currencyLabel;

-(void)createViews;

@end

NS_ASSUME_NONNULL_END
