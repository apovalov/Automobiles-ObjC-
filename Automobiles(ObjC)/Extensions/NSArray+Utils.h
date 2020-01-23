//
//  NSArray+Utils.h
//  Automobiles(ObjC)
//
//  Created by Macbook on 23.01.2020.
//  Copyright © 2020 Valentin Shapovalov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (Utils)
- (NSArray *)map:(id (^)(id obj))block;
- (NSArray *)filter:(BOOL (^)(id obj))block;
- (id)reduce:(id)initial
       block:(id (^)(id obj1, id obj2))block;
- (NSArray *)flatMap:(id (^)(id obj))block;
@end

NS_ASSUME_NONNULL_END
