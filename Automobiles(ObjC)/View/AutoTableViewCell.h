//
//  AutoTableViewCell.h
//  Automobiles(ObjC)
//
//  Created by Macbook on 22.01.2020.
//  Copyright © 2020 Valentin Shapovalov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN



@interface AutoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *modelNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

NS_ASSUME_NONNULL_END
