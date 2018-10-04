//
//  RecommendedTableViewCell.h
//  Mercadopago
//
//  Created by Jorge Mendoza on 10/3/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PayerCost.h"
#import "PureLayout.h"

NS_ASSUME_NONNULL_BEGIN

@interface RecommendedTableViewCell : UITableViewCell

@property(nonatomic, retain) UIImageView * selectedCard;
@property(nonatomic, retain) UILabel * message;
@property(nonatomic, retain) UILabel * detail;


-(void)createViews;
-(void)settData:(PayerCost *)cost;

@end

NS_ASSUME_NONNULL_END
