//
//  SelectionTableViewController.h
//  Mercadopago
//
//  Created by Jorge Mendoza on 10/1/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardTableViewCell.h"
#import "Service.h"
#import "ComposedTRX.h"
#import "TableViewHeaderView.h"
#import "UIViewController+AddNavigationLogo.h"

NS_ASSUME_NONNULL_BEGIN

@interface SelectionTableViewController : UITableViewController

@property(nonatomic, retain)NSMutableArray * dataSource;
@property(nonatomic, retain)NSIndexPath * selectedRow;
@property(nonatomic, retain)ComposedTRX * transaction;
@property(nonatomic, retain)UIView * header;
@property(nonatomic, retain)UIBarButtonItem * item;
@property(nonatomic, retain)UIRefreshControl * refresh;

-(void)setTableViewHeaderWith:(NSString *)title;

-(void)nextViewController:(ComposedTRX *)trx destination:(UIViewController *)controller;

-(IBAction)refresh:(id)sender;

@end

NS_ASSUME_NONNULL_END
