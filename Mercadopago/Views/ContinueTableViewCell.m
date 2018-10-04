//
//  ContinueTableViewCell.m
//  Mercadopago
//
//  Created by Jorge Mendoza on 10/1/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import "ContinueTableViewCell.h"

@implementation ContinueTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)createViews{
    
    self.titleLabel = [[UILabel alloc]init];
    
    UIColor * mainBlue = [UIColor colorWithRed:0.0 green:(153.0/255.0) blue:(223.0/255.0) alpha:1.0];
    
    UIColor * darkBlue = [UIColor colorWithRed:0.0 green:(140.0/255.0) blue:(223.0/255.0) alpha:1.0];
    
    self.titleLabel.textColor = UIColor.whiteColor;
    
    self.titleLabel.font = [UIFont systemFontOfSize:20];
    
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    self.backgroundColor = darkBlue;
    
    [self addSubview:self.titleLabel];
    
    [self setupConstraints];
    
    NSLog(@"Did Created");
}

@end
