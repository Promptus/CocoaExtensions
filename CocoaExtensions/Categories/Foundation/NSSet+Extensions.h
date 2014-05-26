//
//  NSSet+Extensions.h
//  CocoaExtensions
//
//  Created by Lars Kuhnt on 16.05.14.
//  Copyright (c) 2014 Promptus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSSet (Extensions)

+ (NSMutableSet*)setWithDictionary:(NSDictionary*)objects creationBlock:(NSObject*(^)(NSDictionary * data))creationBlock;

@end
