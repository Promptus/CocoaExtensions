//
//  NSArray+Extensions.m
//
//  Created by Lars Kuhnt 31.10.2013.
//  Copyright 2012. All rights reserved.
//

#import "NSArray+Extensions.h"

@implementation NSArray(Extensions)

- (void)each:(void (^)(id item))block {
  NSParameterAssert(block != nil);
  [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    block(obj);
  }];
}

- (void)eachWithIndex:(void (^)(id item, NSUInteger index))block {
  NSParameterAssert(block != nil);
  [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    block(obj, idx);
  }];
}

- (NSArray *)select:(BOOL (^)(id item))block {
  NSParameterAssert(block != nil);
  return [self objectsAtIndexes:[self indexesOfObjectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
    return block(obj);
  }]];
}

- (NSArray *)reject:(BOOL (^)(id item))block {
  return [self select:^BOOL(id obj) {
    return !block(obj);
  }];
}

- (NSArray *)map:(id (^)(id item))block {
  NSParameterAssert(block != nil);
  NSMutableArray *result = [NSMutableArray arrayWithCapacity:self.count];
  [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    id value = block(obj);
    [result addObject:(value ? value : [NSNull null])];
  }];
  return result;
}

@end