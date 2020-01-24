//
//  Networking.m
//  Automobiles(ObjC)
//
//  Created by Macbook on 22.01.2020.
//  Copyright © 2020 Valentin Shapovalov. All rights reserved.
//

#import "Networking.h"
#import "Brand.h"
#import "Car.h"
#import "AFNetworking/AFNetworking.h"

@interface Networking()
//@property (strong, nonatomic) AFHTTPSessionManager *requestManager;
@end

@implementation Networking

+ (void) getBrands: (void(^)(id errorMsg, id response))handler {
    NSString *url = @"http://www.mocky.io/v2/5db959e43000005a005ee206";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager    POST: url
          parameters: nil
            progress: nil
             success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject[@"data"]) {
            
            NSMutableArray *brands = [NSMutableArray array];
            NSArray *brands_response = responseObject[@"data"];
            if ([brands_response isKindOfClass:[NSArray class]]) {
//                [brands_response enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//                    Brand *brand = [Brand parseResponse: obj];
//                    NSLog(@"brand foundationDate: %@", brand.foundationDate);
//                    [brands addObject: brand];
//                }];
                for (int i = 0; i < brands_response.count; i++) {
                    Brand *brand = [Brand parseResponse: brands_response[i]];
                    [brands addObject: brand];
                }
            }
            
            handler(nil, brands);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error: %@", error.localizedDescription);
        handler(error.localizedDescription, nil);
    }];
}

+ (void) getCars: (void(^)(id errorMsg, id response))handler {
    
    NSString *url = @"http://www.mocky.io/v2/5db9630530000095005ee272";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET: url
          parameters: nil
            progress: nil
             success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject[@"data"]) {
            
            NSMutableArray *brands = [NSMutableArray array];
            NSArray *cars_response = responseObject[@"data"];
            if ([cars_response isKindOfClass:[NSArray class]]) {
                for (int i = 0; i < cars_response.count; i++) {
                    Car *car = [Car parseResponse: cars_response[i]];
                    [brands addObject: car];
                }
            }
            
            handler(nil, brands);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error: %@", error.localizedDescription);
        handler(error.localizedDescription, nil);
    }];
}


@end
