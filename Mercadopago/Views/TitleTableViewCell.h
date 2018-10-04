//
//  TitleTableViewCell.h
//  Mercadopago
//
//  Created by Jorge Mendoza on 10/1/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PureLayout.h"

NS_ASSUME_NONNULL_BEGIN

@interface TitleTableViewCell : UITableViewCell

@property (nonatomic, retain)NSString * title;
@property (nonatomic, retain)UILabel * titleLabel;
@property (nonatomic, retain)UIImageView * backgroundImage;

-(void)setCurrentTitle:(NSString *)title;
-(void)createViews;
-(void)setupConstraints;

@end

NS_ASSUME_NONNULL_END
