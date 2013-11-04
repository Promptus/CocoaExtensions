//
//  NSString+Extensions.m
//  CocoaExtensions
//
//  Created by Lars Kuhnt on 04.11.13.
//  Copyright (c) 2013 Promptus. All rights reserved.
//

#import "NSString+Extensions.h"

@implementation NSString (Extensions)

- (NSArray*)scan:(NSString*)pattern {
  return [self scan:pattern options:0];
}

- (NSArray*)scan:(NSString*)pattern options:(NSRegularExpressionOptions)options {
  NSRegularExpression * regex = [NSRegularExpression regularExpressionWithPattern:pattern options:options error:nil];
  NSArray *matches = [regex matchesInString:self options:0 range:NSMakeRange(0, [self length])];
  return [matches map:^(NSTextCheckingResult *match) {
    return [self substringWithRange:[match range]];
  }];
}

@end
