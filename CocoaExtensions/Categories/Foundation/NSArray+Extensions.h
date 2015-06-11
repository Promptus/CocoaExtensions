//
//  NSArray+Extensions.h
//
//  Created by Lars Kuhnt 31.10.2013.
//  Copyright 2012. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray(Extensions)

- (void)ce_each:(void (^)(id item))block;
- (void)ce_eachWithIndex:(void (^)(id item, NSUInteger index))block;
- (NSArray *)ce_select:(BOOL (^)(id item))block;
- (NSArray *)ce_reject:(BOOL (^)(id item))block;
- (NSArray *)ce_map:(id (^)(id item))block;

@end