//
//  NSSet+Extensions.m
//  CocoaExtensions
//
//  Created by Lars Kuhnt on 16.05.14.
//  Copyright (c) 2014 Promptus. All rights reserved.
//

#import "NSSet+Extensions.h"

@implementation NSSet (Extensions)

+ (NSMutableSet*)setWithDictionary:(NSDictionary*)objects creationBlock:(NSObject*(^)(NSDictionary * data))creationBlock {
  NSMutableSet * set = [NSMutableSet setWithCapacity:objects.count];
  for (NSDictionary * dict in objects) {
    NSObject * object = creationBlock(dict);
    if (object)
      [set addObject:object];
  }
  return set;
}

@end
