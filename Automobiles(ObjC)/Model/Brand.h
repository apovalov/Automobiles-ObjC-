//
//  AutoBrand.h
//  Automobiles(ObjC)
//
//  Created by Macbook on 22.01.2020.
//  Copyright © 2020 Valentin Shapovalov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Brand : NSObject

@property(nonatomic, strong) NSString *id;
@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSArray *founderNames;
@property(nonatomic, strong) NSString *foundationDate;

+(Brand*) parseResponse: (id) response;

@end

NS_ASSUME_NONNULL_END
