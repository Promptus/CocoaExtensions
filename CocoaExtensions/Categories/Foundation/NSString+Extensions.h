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

- (NSArray*)scan:(NSString*)pattern;
- (NSArray*)scan:(NSString*)pattern options:(NSRegularExpressionOptions)options;

@end
