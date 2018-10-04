//
//  CardIssuerTableViewController.m
//  Mercadopago
//
//  Created by Jorge Mendoza on 10/2/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import "CardIssuerTableViewController.h"

@interface CardIssuerTableViewController ()

@end

static NSString * cardCellIdentifier = @"CardTableViewCell";

@implementation CardIssuerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTableViewHeaderWith:@"Seleccione el banco emisor"];
    
    self.item = [[UIBarButtonItem alloc]initWithTitle:@"Continuar" style:UIBarButtonItemStylePlain target:self action:@selector(submit:)];
    
    [self.navigationItem setTitle:@"Banco emisor"];
}

-(void)getData{
    
    [self.refresh beginRefreshing];
    
    [[Service shared] getAvailableBankForCard:self.transaction.method.paymentId completion:^(NSData * data, NSURLResponse * response, NSError * error){
        
        if (error == nil) {
            NSError *jsonError = nil;

            id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            
            if (jsonError == nil){
                
                for (NSDictionary * obj in object) {

                    CardIssuer * issuer = [[CardIssuer alloc]initWith:obj];
                    
                    [self.dataSource addObject:issuer];
                }
            
                [NSOperationQueue.mainQueue addOperationWithBlock:^{
                    [self.tableView reloadData];
                }];
            }
        } else {
            self.refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"Ha ocurrido un error"];
        }
        
        [NSOperationQueue.mainQueue addOperationWithBlock:^{
            [self.refresh endRefreshing];
        }];
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cardCellIdentifier forIndexPath:indexPath];
    
    [cell setIssuerData:[self.dataSource objectAtIndex:indexPath.row]];
    
    return cell;
}

- (IBAction)submit:(id)sender {
    
    RecommendedTableViewController * issuerController = [[RecommendedTableViewController alloc] init];
    
    CardIssuer * issuer = [self.dataSource objectAtIndex:self.selectedRow.row];
    
    ComposedTRX * trx = [[ComposedTRX alloc]initWith:self.transaction.amount payment:self.transaction.method settings:issuer installment:nil];
    
    issuerController.transaction = trx;
    
    [self.navigationController pushViewController:issuerController animated:YES];
    
   // [self nextViewController:trx destination:issuerController];
}

@end
