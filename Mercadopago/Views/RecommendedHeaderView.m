//
//  RecommendedHeaderView.m
//  Mercadopago
//
//  Created by Jorge Mendoza on 10/2/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import "RecommendedHeaderView.h"

@implementation RecommendedHeaderView

/* // Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}*/

- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self createViews];
}

-(void)createViews{
    
    UIImage * bg = [UIImage imageNamed:@"lines-pattern"];
    
    self.backgroundImage = [[UIImageView alloc]initWithImage:bg];
    
    self.backgroundImage.contentMode = UIViewContentModeScaleAspectFit;
    
    [self addSubview:self.backgroundImage];
    
    [self sendSubviewToBack:self.backgroundImage];
    
    
    self.cardThumb = [[UIImageView alloc]init];
    
    self.cardThumb.contentMode = UIViewContentModeScaleAspectFit;
    
    [self addSubview:self.cardThumb];
    
    
    self.issuerThumb = [[UIImageView alloc]init];
    
    self.issuerThumb.contentMode = UIViewContentModeScaleAspectFit;
    
    [self addSubview:self.issuerThumb];
    
    
    self.titleLabel = [[UILabel alloc]init];
    
    self.titleLabel.textColor = UIColor.blackColor;
    
    self.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    self.titleLabel.backgroundColor = UIColor.clearColor;
    
    [self addSubview:self.titleLabel];
    
    
    self.quotesLabel = [[UILabel alloc]init];
    
    self.quotesLabel.textColor = UIColor.blackColor;
    
    self.quotesLabel.font = [UIFont boldSystemFontOfSize:18];
    
    self.quotesLabel.textAlignment = NSTextAlignmentCenter;
    
    self.quotesLabel.backgroundColor = UIColor.clearColor;
    
    [self addSubview:self.quotesLabel];
    
    
    self.cardLabel = [[UILabel alloc]init];
    
    self.cardLabel.textColor = UIColor.blackColor;
    
    self.cardLabel.font = [UIFont boldSystemFontOfSize:14];
    
    self.cardLabel.textAlignment = NSTextAlignmentLeft;
    
    self.cardLabel.backgroundColor = UIColor.clearColor;
    
    [self addSubview:self.cardLabel];
    
    
    self.issuerLabel = [[UILabel alloc]init];
    
    self.issuerLabel.textColor = UIColor.blackColor;
    
    self.issuerLabel.font = [UIFont boldSystemFontOfSize:14];
    
    self.issuerLabel.textAlignment = NSTextAlignmentLeft;
    
    self.issuerLabel.backgroundColor = UIColor.clearColor;
    
    [self addSubview:self.issuerLabel];
    
    
    self.trxAmount = [[UILabel alloc]init];
    
    self.trxAmount.textColor = UIColor.blackColor;
    
    self.trxAmount.font = [UIFont systemFontOfSize:14];
    
    self.trxAmount.textAlignment = NSTextAlignmentLeft;
    
    self.trxAmount.backgroundColor = UIColor.clearColor;
    
    [self addSubview:self.trxAmount];
    
    [self setupConstraints];
    
    NSLog(@"Did Created");
}

-(void)setupConstraints{
    
    [self.backgroundImage autoPinEdgesToSuperviewEdges];
    
    [self.titleLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self withOffset:5.0];
    [self.titleLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self withOffset:5.0];
    [self.titleLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self withOffset:-5.0];
    
    [self.cardThumb autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.titleLabel withOffset:5.0];
    [self.cardThumb autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self withOffset:15.0];
    [self.cardThumb autoSetDimensionsToSize:CGSizeMake(50.0, 32.0)];
    
    [self.cardLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.titleLabel withOffset:15.0];
    [self.cardLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self withOffset:91.0];
    [self.cardLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self withOffset:-5.0];
    
    [self.issuerThumb autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.cardThumb withOffset:5.0];
    [self.issuerThumb autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self withOffset:15.0];
    [self.issuerThumb autoSetDimensionsToSize:CGSizeMake(50.0, 32.0)];
    
    [self.issuerLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.cardLabel withOffset:20.0];
    [self.issuerLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self withOffset:91.0];
    [self.issuerLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self withOffset:-5.0];
    
    [self.quotesLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.issuerLabel withOffset:15.0];
    [self.quotesLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self withOffset:5.0];
    [self.quotesLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self withOffset:-5.0];
    [self.quotesLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self withOffset:-5.0];
    
    NSLog(@"Did Constarints");
}

-(void)setData:(ComposedTRX *)trx{
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        
        self.titleLabel.text = [@"Monto a pagar $ " stringByAppendingString:[trx.amount toString]];
        
        self.quotesLabel.text = @"Seleccione una opción";
        
        self.cardLabel.text = trx.method.name;
        
        self.issuerLabel.text = trx.issuer.name;
        
        [self.cardThumb sd_setImageWithURL:[NSURL URLWithString:trx.method.secureThumbnail]
                          placeholderImage:[UIImage imageNamed:@"empty-card"]];
        
        [self.issuerThumb sd_setImageWithURL:[NSURL URLWithString:trx.issuer.secureThumbnail]
                          placeholderImage:[UIImage imageNamed:@"empty-issuer"]];
    }];
}


@end
