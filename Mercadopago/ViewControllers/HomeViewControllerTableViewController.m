//
//  HomeViewControllerTableViewController.m
//  Mercadopago
//
//  Created by Jorge Mendoza on 10/1/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import "HomeViewControllerTableViewController.h"

@interface HomeViewControllerTableViewController ()

@end

static NSString * amountCellIdentifer = @"PaymentAmountTableViewCell";
static NSString * continueCell = @"ContinueTableViewCell";

@implementation HomeViewControllerTableViewController

- (void)viewDidLoad {
   
    [super viewDidLoad];
    
    [self.navigationItem setTitle:@"Inicio"];
    
    [self.tableView registerClass:PaymentAmountTableViewCell.self forCellReuseIdentifier:amountCellIdentifer];
    
    [self.tableView registerClass:ContinueTableViewCell.self forCellReuseIdentifier:continueCell];
    
    [self setTableViewHeaderWith:@"Instroduzca el monto a pagar"];
    
    self.amount = [[NSString alloc]init];
    
    self.navigationController.navigationBar.backItem.hidesBackButton = YES;
    
    [self verifyLoop];
}

-(void)setTableViewHeaderWith:(NSString *)title{
    
    TableViewHeaderView * header = [[TableViewHeaderView alloc]initWithFrame:CGRectMake(0.0, 0.0, self.tableView.frame.size.width, 75.0)];
    
    [header setCurrentTitle:title];
    
    static NSString * headerIdentifier = @"TableViewHeaderView";
    
    [self.tableView registerClass:TableViewHeaderView.self forHeaderFooterViewReuseIdentifier:headerIdentifier];
    
    self.tableView.tableHeaderView = header;
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self.navigationItem setHidesBackButton:YES];
    
    UITextField * tf = [self.view viewWithTag:123];
    
    self.amount = tf.text;
    
    [self addNavigationLogo];
    
}

-(NSNumber * _Nullable)getAmount {
    
    UITextField * tf = [self.view viewWithTag:123];
    
    return [tf.text toNumber];
}

-(void)verifyLoop{
    
    if (self.loop != NO && self.transaction != nil){
        
        //This is the end of one transacction
        NSString * message =
        
        [NSString stringWithFormat:@"Ud. ha realizado una transacción por $ %@  utilizando su tarjeta de crédito %@ del banco %@ de la siguiente manera %@ "
         , self.transaction.amount
         , self.transaction.method.name
         , self.transaction.issuer.name
         , self.transaction.cost.recommendedMessage];
        
        UIAlertController * notification = [UIAlertController alertControllerWithTitle:@"Transacción exitosa" message:message preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction* okButton = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {  }];
        
        [notification addAction:okButton];
        
        [self presentViewController:notification animated:YES completion:nil];
        
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
            
        case 0:
        {
            PaymentAmountTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:amountCellIdentifer forIndexPath:indexPath];
            
            [cell createViews];
            
            cell.amountField.delegate = self;
            
            return cell;
            
            break;
        }
            
        default:{
            
            ContinueTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:continueCell forIndexPath:indexPath];
            
            [cell createViews];
            
            [cell setCurrentTitle:@"Continuar"];
            
            return cell;
            
            break;
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {

        case 0:
        {
            return 115.0;
            break;
        }
            
        default:
        {
            return 60.0;
            break;
        }
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
        {
            break;
        }
            
        default:
        {
            
            [tableView deselectRowAtIndexPath:indexPath animated:true];
            
            CardSelectionTableViewController * cardSelection = [[CardSelectionTableViewController alloc] init];
            
            ComposedTRX * trx = [[ComposedTRX alloc]initWith:[self getAmount] payment:nil settings:nil installment:nil];
            
            cardSelection.transaction = trx;
            
            [self.navigationController pushViewController:cardSelection animated:YES];
            
            break;
        }
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 75.0;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [[UIView alloc] init];
}

#pragma mark - UITextField Delegate

-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    self.amount = textField.text;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    self.amount = textField.text;
}

@end
