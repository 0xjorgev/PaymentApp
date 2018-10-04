//
//  RecommendedTableViewController.m
//  Mercadopago
//
//  Created by Jorge Mendoza on 10/2/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import "RecommendedTableViewController.h"

@interface RecommendedTableViewController ()

@end

@implementation RecommendedTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:RecommendedTableViewCell.self forCellReuseIdentifier:@"Cell"];
    
    self.item = [[UIBarButtonItem alloc]initWithTitle:@"Continuar" style:UIBarButtonItemStylePlain target:self action:@selector(submit:)];
    
    [self setTableViewHeaderWith:@""];
    
    [self.navigationItem setTitle:@"Cuotas"];
}

-(void)getData {
    
    [self.refresh beginRefreshing];
    
    [[Service shared] getRecommendedMessage:[self.transaction.amount toString] with:self.transaction.method.paymentId with:self.transaction.issuer.issuerId completion:^(NSData * data, NSURLResponse * response, NSError * error){

        if (error == nil) {
            
            NSError *jsonError = nil;
            
            id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            
            if (jsonError == nil) {

                Installments * installment = [[Installments alloc]initWith:object];
            
                self.dataSource = installment.payerCosts;
            
                [NSOperationQueue.mainQueue addOperationWithBlock:^{
                    [self.tableView reloadData];
                }];
            }
        } else {
//            self.refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"Ha ocurrido un error"];
        }
        
        [NSOperationQueue.mainQueue addOperationWithBlock:^{
            [self.refresh endRefreshing];
        }];
    }];
    
}

- (IBAction)submit:(id)sender {
    
    HomeViewControllerTableViewController * homeController = [[HomeViewControllerTableViewController alloc] init];
    
    PayerCost * cost = [self.dataSource objectAtIndex:self.selectedRow.row];
    
    ComposedTRX * trx = [[ComposedTRX alloc]initWith:self.transaction.amount payment:self.transaction.method settings:self.transaction.issuer installment:cost];
    
    homeController.transaction = trx;
    
    homeController.loop = YES;
    
    [self.navigationController pushViewController:homeController animated:YES];
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RecommendedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    PayerCost * tmp = [self.dataSource objectAtIndex:indexPath.row];
    
    [cell settData:tmp];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80.0;
}

-(void)setTableViewHeaderWith:(NSString *)title{
    
    RecommendedHeaderView * header = [[RecommendedHeaderView alloc]initWithFrame:CGRectMake(0.0, 0.0, self.tableView.frame.size.width, 145.0)];
    
    [header setData:self.transaction];
    
    static NSString * headerIdentifier = @"TableViewHeaderView";
    
    [self.tableView registerClass:RecommendedHeaderView.self forHeaderFooterViewReuseIdentifier:headerIdentifier];
    
    self.tableView.tableHeaderView = header;
    
}

@end
