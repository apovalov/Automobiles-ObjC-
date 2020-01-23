//
//  AutoBrand.m
//  Automobiles(ObjC)
//
//  Created by Macbook on 22.01.2020.
//  Copyright © 2020 Valentin Shapovalov. All rights reserved.
//

#import "Brand.h"
#import "Car.h"
#import "NSArray+Utils.h"

@implementation Brand

+(Brand*) parseResponse: (id) response {
    Brand *brand = [[Brand alloc] init];
    
    brand.id = response[@"id"] != [NSNull null] ? [NSString stringWithFormat:@"%@", response[@"id"]] : @"";
    brand.founderNames = [response[@"founder_names"] isKindOfClass:[NSArray class]] ? response[@"founder_names"]: @[];
    brand.name = response[@"brand_names"] != [NSNull null] ? [NSString stringWithFormat:@"%@", response[@"brand_name"]] : @"";
    brand.foundationDate = response[@"foundationDate"] != [NSNull null] ? [NSString stringWithFormat:@"%@", response[@"foundationDate"]] : @"";
    
    return brand;
}

- (instancetype)initWithCars: (NSArray*) cars brand:(Brand*) brand
{
    self = [super init];
    if (self) {
        NSArray *brandCars = [cars filter:^BOOL(id  _Nonnull obj) {
            Car *car = (Car *)obj;
            return [car.brandId isEqualToString: brand.id];
        }];
        brand.cars = brandCars;
        return brand;
    }
    return self;
}

@end
