//
//  MainViewController.m
//  Automobiles(ObjC)
//
//  Created by Macbook on 22.01.2020.
//  Copyright © 2020 Valentin Shapovalov. All rights reserved.
//

#import "MainViewController.h"
#import "Brand.h"
#import "AutoTableViewCell.h"
#import "Networking.h"
#import "UIViewController+Utils.h"


@interface MainViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
//@property Networking *networking;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [Networking getBrands:^(id  _Nonnull errorMsg, id  _Nonnull response) {
        if (errorMsg) {
            [self showAlertWithTitle:@"Ошибка" message:errorMsg];
        } else {
            self.brands = [NSArray arrayWithArray: response];
            [self.tableView reloadData];
        }
    }];
    // Do any additional setup after loading the view.
}


//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"numberOfRowsInSection: @%lu", (unsigned long)[_brands count]);
    return [_brands count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AutoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"cell" forIndexPath:indexPath];
    Brand *brand = [self.brands objectAtIndex: indexPath.row];
    cell.modelNameLabel.text = brand.name;
    cell.dateLabel.text = brand.foundationDate;
    return cell;
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
