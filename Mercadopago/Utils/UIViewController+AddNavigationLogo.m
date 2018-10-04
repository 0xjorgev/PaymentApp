//
//  UIViewController+AddNavigationLogo.m
//  Mercadopago
//
//  Created by Jorge Mendoza on 10/4/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import "UIViewController+AddNavigationLogo.h"

@implementation UIViewController (AddNavigationLogo)

-(void)addNavigationLogo{
    
    if (self.navigationItem.titleView == nil){
        UIImageView * imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mp-logo"]];
        
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        self.navigationItem.titleView = imageView;
    }
}

@end
