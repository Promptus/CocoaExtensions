//
//  NSString+Extensions.h
//  CocoaExtensions
//
//  Created by Lars Kuhnt on 04.11.13.
//  Copyright (c) 2013 Promptus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSArray+Extensions.h"

@interface NSString (Extensions)

- (NSArray*)match:(NSString*)pattern;
- (NSArray*)match:(NSString*)pattern options:(NSRegularExpressionOptions)options;

@end
