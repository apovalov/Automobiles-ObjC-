//
//  Car.m
//  Automobiles(ObjC)
//
//  Created by Macbook on 23.01.2020.
//  Copyright © 2020 Valentin Shapovalov. All rights reserved.
//

#import "Car.h"

@implementation Car

+(Car*) parseResponse: (id) response {
    Car *car = [[Car alloc] init];
    car.brandId = response[@"brand_id"] != [NSNull null] ? [NSString stringWithFormat:@"%@", response[@"brand_id"]] : @"";
    car.model = response[@"modelName"] != [NSNull null] ? [NSString stringWithFormat: @"%@", response[@"modelName"]] : @"";
    car.modelDate = response[@"releaseDate"] != [NSNull null] ? [NSString stringWithFormat: @"%@", response[@"releaseDate"]] : @"";
    
    return car;
}
@end
