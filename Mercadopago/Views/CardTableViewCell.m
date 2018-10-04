//
//  CardTableViewCell.m
//  Mercadopago
//
//  Created by Jorge Mendoza on 10/1/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import "CardTableViewCell.h"


@implementation CardTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) { [self createViews]; }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    if (selected) {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.selectedCard.image = [UIImage imageNamed:@"selected"];
        }];
    } else {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.selectedCard.image = [UIImage imageNamed:@"non-selected"];
        }];
    }
}

-(void)createViews{
    
    self.thumbnail = [[UIImageView alloc] init];
    
    self.thumbnail.contentMode = UIViewContentModeScaleAspectFit;
    
    [self addSubview:self.thumbnail];
    
    
    self.cardnameLabel = [[UILabel alloc]init];
    
    self.cardnameLabel.font = [UIFont systemFontOfSize:18];
    
    self.cardnameLabel.textAlignment = NSTextAlignmentLeft;
    
    self.cardnameLabel.textColor = UIColor.blackColor;
    
    self.cardnameLabel.adjustsFontSizeToFitWidth = YES;
    
    [self addSubview:self.cardnameLabel];
    
    
    self.selectedCard = [[UIImageView alloc] init];
    
    self.selectedCard.contentMode = UIViewContentModeScaleAspectFit;
    
    self.selectedCard.image = [UIImage imageNamed:@"non-selected"];
    
    [self addSubview:self.selectedCard];
    
    
    [self setupConstraints];
    
}

-(void)setupConstraints{
    
    
    [self.thumbnail autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self withOffset:5.0];
    [self.thumbnail autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self withOffset:5.0];
    [self.thumbnail autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self withOffset:-5.0];
    [self.thumbnail autoSetDimension:ALDimensionWidth toSize:45.0];
    
    [self.cardnameLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self withOffset:5.0];
    [self.cardnameLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self withOffset:60.0];
    [self.cardnameLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self withOffset:-40.0];
    [self.cardnameLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self withOffset:-5.0];
    
    [self.selectedCard autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self withOffset:5.0];
    [self.selectedCard autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self withOffset:-15.0];
    [self.selectedCard autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self withOffset:-5.0];
    [self.selectedCard autoSetDimensionsToSize:CGSizeMake(25.0, 25.0)];
    
}

-(void)setPaymentMethod:(PaymentMethod *)card{
    
//    self.card = card;
    
    [self.thumbnail sd_setImageWithURL:[NSURL URLWithString:card.secureThumbnail]
                 placeholderImage:[UIImage imageNamed:@"empty-card"]];
    
    self.cardnameLabel.text = card.name;
}

-(void)setIssuerData:(CardIssuer *)issuer {
    
    [self.thumbnail sd_setImageWithURL:[NSURL URLWithString:issuer.secureThumbnail]
                      placeholderImage:[UIImage imageNamed:@"empty-issuer"]];
    self.cardnameLabel.text = issuer.name;
}

//-(void)setTrxData:(ComposedTRX *)trx {
//
//    //self.card = card;
//
//    [self.thumbnail sd_setImageWithURL:[NSURL URLWithString: trx.setup. ]
//                      placeholderImage:[UIImage imageNamed:@"empty-card"]];
//
//    self.cardnameLabel.text = card.name;
//
//}

@end
