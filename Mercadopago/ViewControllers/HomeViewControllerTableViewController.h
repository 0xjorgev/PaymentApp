//
//  HomeViewControllerTableViewController.h
//  Mercadopago
//
//  Created by Jorge Mendoza on 10/1/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TitleTableViewCell.h"
#import "PaymentAmountTableViewCell.h"
#import "ContinueTableViewCell.h"
#import "CardSelectionTableViewController.h"
#import "TableViewHeaderView.h"
#import "NSString+NumberFromString.h"
#import "ComposedTRX.h"
#import "UIViewController+AddNavigationLogo.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeViewControllerTableViewController : UITableViewController <UITextFieldDelegate>

@property(nonatomic, retain)NSMutableArray * dataSource;
@property(nonatomic, retain)NSString * amount;
@property(nonatomic, retain)ComposedTRX * transaction;
@property(nonatomic)BOOL loop;


@end

NS_ASSUME_NONNULL_END
