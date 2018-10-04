//
//  TableViewHeaderView.m
//  Mercadopago
//
//  Created by Jorge Mendoza on 10/2/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import "TableViewHeaderView.h"

@implementation TableViewHeaderView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
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
    
    
    self.titleLabel = [[UILabel alloc]init];
    
    self.titleLabel.textColor = UIColor.blackColor;
    
    self.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    self.titleLabel.backgroundColor = UIColor.clearColor;
    
    [self addSubview:self.titleLabel];
    
    [self setupConstraints];
}

-(void)setupConstraints{
    
    [self.backgroundImage autoPinEdgesToSuperviewEdges];
    
    [self.titleLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self withOffset:5.0];
    [self.titleLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self withOffset:24.0];
    [self.titleLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self withOffset:-5.0];
    [self.titleLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self withOffset:-5.0];
    
}

-(void)setCurrentTitle:(NSString *)title{
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        self.titleLabel.text = title;
    }];
}

@end
