//
//  MainViewController.m
//  Automobiles(ObjC)
//
//  Created by Macbook on 22.01.2020.
//  Copyright © 2020 Valentin Shapovalov. All rights reserved.
//

#import "MainViewController.h"
#import "Brand.h"
#import "Car.h"
#import "AutoTableViewCell.h"
#import "CellsHeaderView.h"
#import "Networking.h"
#import "UIViewController+Utils.h"
#import "NSArray+Utils.h"



@interface MainViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
//@property Networking *networking;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchData];
    
    // Do any additional setup after loading the view.
}

- (void)fetchData {
    
    __weak MainViewController* weakSelf = self;
    
    dispatch_group_t fetchDataGroup =dispatch_group_create();
    
    dispatch_group_enter(fetchDataGroup);
    dispatch_group_enter(fetchDataGroup);
    
    [Networking getBrands:^(id  _Nonnull errorMsg, id  _Nonnull response) {
        if (errorMsg) {
            [weakSelf showAlertWithTitle:@"Ошибка" message:errorMsg];
        } else {
            weakSelf.brands = [NSMutableArray arrayWithArray: response];
            [weakSelf.tableView reloadData];
        }
        dispatch_group_leave(fetchDataGroup);
    }];
    
    [Networking getCars:^(id  _Nonnull errorMsg, id  _Nonnull response) {
        if (errorMsg) {
            [weakSelf showAlertWithTitle:@"Ошибка" message:errorMsg];
        } else {
            NSArray<Car *> *cars = response;
            
            weakSelf.brands = [weakSelf.brands map:^id _Nonnull(id  _Nonnull obj) {
                Brand *brand = (Brand *)obj;
                brand = [[Brand alloc] initWithCars:cars
                                              brand:brand] ;
                return brand;
            }];
            
            [weakSelf.tableView reloadData];
        }
        dispatch_group_leave(fetchDataGroup);
    }];
    
    dispatch_group_notify(fetchDataGroup, dispatch_get_main_queue(), ^{
        NSLog(@"All data fetched!");
        [weakSelf.tableView reloadData];
    });
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.brands count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    Brand *brand = [self.brands objectAtIndex: section];
    return brand.cars != nil ? [brand.cars count] : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AutoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"cell" forIndexPath:indexPath];
    Brand *brand = [self.brands objectAtIndex: indexPath.section];
    Car *car = [brand.cars objectAtIndex: indexPath.row];
    
    cell.modelNameLabel.text = car.model;
    cell.dateLabel.text = car.modelDate;
    
    return cell;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    CellsHeaderView *headerView = [[UINib nibWithNibName:@"CellsHeaderView" bundle:nil] instantiateWithOwner:self options:nil].firstObject;
    Brand *brand = [self.brands objectAtIndex: section];
    [headerView configureWithBrand: brand];
    return headerView;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 68.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0;
}




/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */



@end
