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

#pragma mark Regular expressions
- (NSArray*)match:(NSString*)pattern;
- (NSArray*)match:(NSString*)pattern options:(NSRegularExpressionOptions)options;
- (NSArray*)scan:(NSString*)pattern;
- (NSArray*)scan:(NSString*)pattern options:(NSRegularExpressionOptions)options;

+ (BOOL)isPresent:(NSString*)string;
+ (BOOL)isBlank:(NSString*)string;
- (BOOL)isPresent;
- (BOOL)isBlank;

+ (NSString*)blankDefault:(id)value;

- (NSString *)encodeUrlString:(NSStringEncoding)encoding;

@end
