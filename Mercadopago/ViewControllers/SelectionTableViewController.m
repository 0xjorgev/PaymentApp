//
//  SelectionTableViewController.m
//  Mercadopago
//
//  Created by Jorge Mendoza on 10/1/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

#import "SelectionTableViewController.h"

@interface SelectionTableViewController ()

@end

static NSString * cardCellIdentifier = @"CardTableViewCell";

@implementation SelectionTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = [[NSMutableArray alloc] init];
    
    [self addNavigationLogo];
    
    [self.tableView registerClass:CardTableViewCell.self forCellReuseIdentifier:cardCellIdentifier];
    
    self.refresh = [[UIRefreshControl alloc]init];
    
    self.refresh.tintColor = UIColor.blackColor;
    
    [self.refresh addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    
    [self.tableView addSubview:self.refresh];
    
    [self getData];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self addNavigationLogo];
}

-(void)getData{}

-(IBAction)refresh:(id)sender{
    
    [self getData];
    //[self.refresh endRefreshing];
}

-(void)setTableViewHeaderWith:(NSString *)title{
    
    TableViewHeaderView * header = [[TableViewHeaderView alloc]initWithFrame:CGRectMake(0.0, 0.0, self.tableView.frame.size.width, 75.0)];
    
    [header setCurrentTitle:title];
    
    static NSString * headerIdentifier = @"TableViewHeaderView";
    
    [self.tableView registerClass:TableViewHeaderView.self forHeaderFooterViewReuseIdentifier:headerIdentifier];
    
    self.tableView.tableHeaderView = header;
    
}

-(void)nextViewController:(ComposedTRX *)trx destination:(UIViewController *)controller{
    
    [self.navigationController pushViewController:controller animated:YES];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cardCellIdentifier forIndexPath:indexPath];
    
    [cell setPaymentMethod:[self.dataSource objectAtIndex:indexPath.row]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.selectedRow = indexPath;
    
    if (self.selectedRow == nil) {
        self.navigationItem.rightBarButtonItem = nil;
    } else {
        self.navigationItem.rightBarButtonItem = self.item;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [[UIView alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 75.0;
    
}
@end
