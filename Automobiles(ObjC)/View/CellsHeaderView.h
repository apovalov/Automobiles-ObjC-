//
//  CellsHeaderView.h
//  Automobiles(ObjC)
//
//  Created by Macbook on 23.01.2020.
//  Copyright © 2020 Valentin Shapovalov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Brand.h"

NS_ASSUME_NONNULL_BEGIN

@interface CellsHeaderView : UIView
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *brandName;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *founderName;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *foundCompanyDate;

- (void)configureWithBrand: (Brand *) brand;


@end

NS_ASSUME_NONNULL_END
