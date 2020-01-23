//
//  NSArray+Utils.m
//  Automobiles(ObjC)
//
//  Created by Macbook on 23.01.2020.
//  Copyright © 2020 Valentin Shapovalov. All rights reserved.
//

#import "NSArray+Utils.h"

@implementation NSArray(Utils)
    - (NSArray *)map:(id (^)(id obj))block {
        NSMutableArray *mutableArray = [NSMutableArray new];
        [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [mutableArray addObject:block(obj)];
        }];
        return [mutableArray copy];
    }

    - (NSArray *)filter:(BOOL (^)(id obj))block {
        NSMutableArray *mutableArray = [NSMutableArray new];
        [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if (block(obj) == YES) {
                [mutableArray addObject:obj];
            }
        }];
        return [mutableArray copy];
    }

    - (id)reduce:(id)initial
           block:(id (^)(id obj1, id obj2))block {
        __block id obj = initial;
        [self enumerateObjectsUsingBlock:^(id _obj, NSUInteger idx, BOOL *stop) {
            obj = block(obj, _obj);
        }];
        return obj;
    }

    - (NSArray *)flatMap:(id (^)(id obj))block {
        NSMutableArray *mutableArray = [NSMutableArray new];
        [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            id _obj = block(obj);
            if ([_obj isKindOfClass:[NSArray class]]) {
                NSArray *_array = [_obj flatMap:block];
                [mutableArray addObjectsFromArray:_array];
                return;
            }
            [mutableArray addObject:_obj];
        }];
        return [mutableArray copy];
    }
@end
