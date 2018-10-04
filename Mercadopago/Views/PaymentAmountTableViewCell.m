//
//  PaymentAmountTableViewCell.m
//  Mercadopago
//
//  Created by Jorge Mendoza on 10/1/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import "PaymentAmountTableViewCell.h"


@implementation PaymentAmountTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)createViews{
    
    self.amountField = [[UITextField alloc]init];
    
    self.amountField.textColor = UIColor.blackColor;
    
    self.amountField.font = [UIFont systemFontOfSize:36];
    
    self.amountField.textAlignment = NSTextAlignmentLeft;
    
    self.amountField.keyboardType = UIKeyboardTypeDecimalPad;
    
    self.amountField.placeholder = @"0.0";
    
    self.amountField.tag = 123;
    
    self.amountField.adjustsFontSizeToFitWidth = YES;
    
    
    self.currencyLabel = [[UILabel alloc]init];
    
    self.currencyLabel.textColor = UIColor.blackColor;
    
    self.currencyLabel.font = [UIFont systemFontOfSize:36];
    
    self.currencyLabel.textAlignment = NSTextAlignmentLeft;
    
    self.currencyLabel.text = @"$. ";
    
    
    
    [self addSubview:self.amountField];
    
    [self addSubview:self.currencyLabel];
    
    [self setupConstraints];
    
    NSLog(@"Did Created");
}

-(void)setupConstraints{
    
    [self.currencyLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self withOffset:5.0];
    [self.currencyLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self withOffset:5.0];
//    [self.currencyLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self withOffset:-5.0];
    [self.currencyLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self withOffset:-5.0];
    
    [self.amountField autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self withOffset:5.0];
    [self.amountField autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self withOffset:42.0];
    [self.amountField autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self withOffset:-5.0];
    [self.amountField autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self withOffset:-5.0];
    
    
    
    NSLog(@"Did Constarints");
}

//-(void)setCurrentTitle:(NSString *)title{
//    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//        self.amountField.text = title;
//    }];
//}

@end
