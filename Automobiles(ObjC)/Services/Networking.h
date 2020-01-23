//
//  Networking.h
//  Automobiles(ObjC)
//
//  Created by Macbook on 22.01.2020.
//  Copyright © 2020 Valentin Shapovalov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Networking : NSObject

+ (void) getBrands: (void(^)(id errorMsg, id response))handler;
+ (void) getCars: (void(^)(id errorMsg, id response))handler;
@end

NS_ASSUME_NONNULL_END
