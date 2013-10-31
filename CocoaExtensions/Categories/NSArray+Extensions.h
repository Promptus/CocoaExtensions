//
//  NSArray+Extensions.h
//
//  Created by Lars Kuhnt 31.10.2013.
//  Copyright 2012. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray(Extensions)

- (void)each:(void (^)(id item))block;
- (void)eachWithIndex:(void (^)(id item, NSUInteger index))block;
- (NSArray *)select:(BOOL (^)(id item))block;
- (NSArray *)reject:(BOOL (^)(id item))block;
- (NSArray *)map:(id (^)(id item))block;

@end