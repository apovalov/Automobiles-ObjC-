//
//  AutoTableViewCell.m
//  Automobiles(ObjC)
//
//  Created by Macbook on 22.01.2020.
//  Copyright © 2020 Valentin Shapovalov. All rights reserved.
//

#import "AutoTableViewCell.h"


@implementation AutoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureWithCar: (Car *) car {
    self.dateLabel.text = car.modelDate;
    self.modelNameLabel.text = car.model;
}

@end
