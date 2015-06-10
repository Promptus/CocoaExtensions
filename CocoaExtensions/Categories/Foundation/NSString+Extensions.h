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
- (NSArray*)ce_match:(NSString*)pattern;
- (NSArray*)ce_match:(NSString *)pattern options:(NSRegularExpressionOptions)options;
- (NSArray*)ce_scan:(NSString*)pattern;
- (NSArray*)ce_scan:(NSString *)pattern options:(NSRegularExpressionOptions)options;

+ (BOOL)ce_isPresent:(NSString*)string;
+ (BOOL)ce_isBlank:(NSString*)string;
- (BOOL)ce_isPresent;
- (BOOL)ce_isBlank;

+ (NSString*)ce_blankDefault:(id)value;

- (NSString *)ce_urlStringUsingEncoding:(NSStringEncoding)encoding;
- (NSString *)ce_removeAllWhiteSpaces;

@end
