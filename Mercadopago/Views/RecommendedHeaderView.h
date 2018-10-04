//
//  RecommendedHeaderView.h
//  Mercadopago
//
//  Created by Jorge Mendoza on 10/2/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ComposedTRX.h"
#import "PureLayout.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "NSNumber+StringFromNumber.h"

NS_ASSUME_NONNULL_BEGIN

@interface RecommendedHeaderView : UITableViewHeaderFooterView

@property(nonatomic, retain)UIImageView * cardThumb;
@property(nonatomic, retain)UIImageView * issuerThumb;
@property(nonatomic, retain)UIImageView * backgroundImage;
@property(nonatomic, retain)UILabel * titleLabel;
@property(nonatomic, retain)UILabel * quotesLabel;
@property(nonatomic, retain)UILabel * cardLabel;
@property(nonatomic, retain)UILabel * issuerLabel;
@property(nonatomic, retain)UILabel * trxAmount;

-(void)setData:(ComposedTRX *)trx;

@end

NS_ASSUME_NONNULL_END
