//
//  RecommendedTableViewController.h
//  Mercadopago
//
//  Created by Jorge Mendoza on 10/2/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import "SelectionTableViewController.h"
#import "Installments.h"
#import "RecommendedTableViewCell.h"
#import "RecommendedHeaderView.h"
#import "HomeViewControllerTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface RecommendedTableViewController : SelectionTableViewController

-(void)setTableViewHeaderWith:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
