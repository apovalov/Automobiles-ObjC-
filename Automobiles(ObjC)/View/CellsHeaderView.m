//
//  CellsHeaderView.m
//  Automobiles(ObjC)
//
//  Created by Macbook on 23.01.2020.
//  Copyright © 2020 Valentin Shapovalov. All rights reserved.
//

#import "CellsHeaderView.h"

@implementation CellsHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)configureWithBrand: (Brand *) brand {
    self.brandName.text = brand.name;
    self.foundCompanyDate.text = brand.foundationDate;
    self.founderName.text = brand.founderNames.firstObject;
}

@end
