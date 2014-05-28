//
//  NSSet+Extensions.m
//  CocoaExtensions
//
//  Created by Lars Kuhnt on 16.05.14.
//  Copyright (c) 2014 Promptus. All rights reserved.
//

#import "NSSet+Extensions.h"

@implementation NSSet (Extensions)

+ (NSMutableSet*)setWithEnumerable:(id<NSFastEnumeration>)enumerable creationBlock:(NSObject*(^)(NSDictionary * data))creationBlock {
  NSMutableSet * set = [NSMutableSet set];
  for (NSDictionary * dict in enumerable) {
    NSObject * object = creationBlock(dict);
    if (object)
      [set addObject:object];
  }
  return set;
}

@end
