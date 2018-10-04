//
//  RecommendedTableViewCell.m
//  Mercadopago
//
//  Created by Jorge Mendoza on 10/3/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import "RecommendedTableViewCell.h"

@implementation RecommendedTableViewCell

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
    
    
    self.message = [[UILabel alloc]init];
    
    self.message.font = [UIFont boldSystemFontOfSize:14];
    
    self.message.textAlignment = NSTextAlignmentLeft;
    
    self.message.textColor = UIColor.blackColor;
    
    self.message.numberOfLines = 2;
    
    [self addSubview:self.message];
    
    
    self.detail = [[UILabel alloc]init];
    
    self.detail.font = [UIFont systemFontOfSize:12];
    
    self.detail.textAlignment = NSTextAlignmentLeft;
    
    self.detail.textColor = UIColor.grayColor;
    
    self.detail.adjustsFontSizeToFitWidth = YES;
    
    [self addSubview:self.detail];
    
    
    self.selectedCard = [[UIImageView alloc] init];
    
    self.selectedCard.contentMode = UIViewContentModeScaleAspectFit;
    
    self.selectedCard.image = [UIImage imageNamed:@"non-selected"];
    
    [self addSubview:self.selectedCard];
    
    
    [self setupConstraints];
    
}

-(void)setupConstraints{
    
    
    [self.message autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self withOffset:8.0];
    [self.message autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self withOffset:16.0];
    [self.message autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self withOffset:-40.0];
//    [self.message autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self withOffset:-5.0];
    
    [self.detail autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.message withOffset:8.0];
    [self.detail autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self withOffset:16.0];
    [self.detail autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self withOffset:-40.0];
    [self.detail autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self withOffset:-5.0];
    
    [self.selectedCard autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self withOffset:5.0];
    [self.selectedCard autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self withOffset:-15.0];
    [self.selectedCard autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self withOffset:-5.0];
    [self.selectedCard autoSetDimensionsToSize:CGSizeMake(25.0, 25.0)];
    
}

-(void)settData:(PayerCost *)cost{
    
    self.message.text = cost.recommendedMessage;
    
    NSString * labels = [[NSString alloc]init];
    
    for (NSString * text in cost.labels){
        labels = [labels stringByAppendingString:[text stringByAppendingString:@" "]];
    }
    
    self.detail.text = labels;
}

@end
