//
//  NSString+Extensions.m
//  CocoaExtensions
//
//  Created by Lars Kuhnt on 04.11.13.
//  Copyright (c) 2013 Promptus. All rights reserved.
//

#import "NSString+Extensions.h"

@implementation NSString (Extensions)

- (NSArray*)match:(NSString*)pattern {
  return [self match:pattern options:0];
}

- (NSArray*)match:(NSString*)pattern options:(NSRegularExpressionOptions)options {
  NSRegularExpression * regex = [NSRegularExpression regularExpressionWithPattern:pattern options:options error:nil];
  NSTextCheckingResult * result = [regex firstMatchInString:self options:0 range:NSMakeRange(0, [self length])];
  NSMutableArray * matches = [NSMutableArray arrayWithCapacity:[result numberOfRanges]];
  if (result.range.location != NSNotFound) {
    for (int i = 0; i < [result numberOfRanges]; i++) {
      NSRange range = [result rangeAtIndex:i];
      [matches addObject:[self substringWithRange:range]];
    }
  }
  return matches;
}

@end
