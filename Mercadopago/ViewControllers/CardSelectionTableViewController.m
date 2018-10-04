//
//  CardSelectionTableViewController.m
//  Mercadopago
//
//  Created by Jorge Mendoza on 10/2/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import "CardSelectionTableViewController.h"

@interface CardSelectionTableViewController ()

@end

static NSString * cardCellIdentifier = @"CardTableViewCell";

@implementation CardSelectionTableViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    
    [self setTableViewHeaderWith:@"Seleccione su medio de pago"];
    
    self.item = [[UIBarButtonItem alloc]initWithTitle:@"Continuar" style:UIBarButtonItemStylePlain target:self action:@selector(submit:)];
    
    [self.navigationItem setTitle:@"Tarjeta de Crédito"];
}

-(void)getData{
    
    [self.refresh beginRefreshing];
    
     [[Service shared] getPaymentMethods:^(NSData * data, NSURLResponse * response, NSError * error){
    
         if (error == nil) {
             NSError *jsonError = nil;
         
             id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
         
             if (jsonError == nil) {
                 
                 for (NSDictionary * obj in object) {
                 
                     if ([[obj valueForKey:@"payment_type_id"] isEqualToString:@"credit_card"]){
                     
                         PaymentMethod * payment = [[PaymentMethod alloc] initWithDictionary:obj];
                         
                         [self.dataSource addObject:payment];
                     }
                 }
             }
         
         [NSOperationQueue.mainQueue addOperationWithBlock:^{
             [self.tableView reloadData];
         }];
         } else {
//            [NSOperationQueue.mainQueue addOperationWithBlock:^{
//                 self.refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"Ha ocurrido un error"];
//            }];
         }
         
         [NSOperationQueue.mainQueue addOperationWithBlock:^{
             [self.refresh endRefreshing];
         }];
     }];
}

- (IBAction)submit:(id)sender {
    
    CardIssuerTableViewController * issuerController = [[CardIssuerTableViewController alloc] init];
    
    PaymentMethod * payment = [self.dataSource objectAtIndex:self.selectedRow.row];
    
    ComposedTRX * trx = [[ComposedTRX alloc]initWith:self.transaction.amount payment:payment settings:nil installment:nil];
    
    issuerController.transaction = trx;
    
    [self.navigationController pushViewController:issuerController animated:YES];
    
      //  [self nextViewController:trx destination:issuerController];
}


#pragma mark - Table view data source


@end
