//
//  Car.h
//  Automobiles(ObjC)
//
//  Created by Macbook on 23.01.2020.
//  Copyright © 2020 Valentin Shapovalov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Car : NSObject
@property(nonatomic, strong) NSString *brandId;
@property(nonatomic, strong) NSString *model;
@property(nonatomic, strong) NSString *modelDate;

+(Car*) parseResponse: (id) response;
@end

NS_ASSUME_NONNULL_END
