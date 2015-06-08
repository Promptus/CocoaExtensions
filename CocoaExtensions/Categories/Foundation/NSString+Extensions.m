//
//  NSString+Extensions.m
//  CocoaExtensions
//
//  Created by Lars Kuhnt on 04.11.13.
//  Copyright (c) 2013 Promptus. All rights reserved.
//

#import "NSString+Extensions.h"

@implementation NSString (Extensions)


#pragma mark Regular expressions

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

- (NSArray*)scan:(NSString*)pattern {
  return [self scan:pattern options:0];
}

- (NSArray*)scan:(NSString*)pattern options:(NSRegularExpressionOptions)options {
  NSRegularExpression * regex = [NSRegularExpression regularExpressionWithPattern:pattern options:options error:nil];
  NSArray * result = [regex matchesInString:self options:0 range:NSMakeRange(0, [self length])];
  NSMutableArray * matches = [NSMutableArray arrayWithCapacity:result.count];
  for (NSTextCheckingResult * match in result) {
    NSRange range = [match range];
    [matches addObject:[self substringWithRange:range]];
  }
  return matches;
}

+ (BOOL)isBlank:(NSString*)string {
  return ![NSString isPresent:string];
}

+ (BOOL)isPresent:(NSString*)string {
  return [string isKindOfClass:[NSString class]] && ![string isEqualToString:@""];
}

- (BOOL)isBlank {
  return [NSString isBlank:self];
}

- (BOOL)isPresent {
  return [NSString isPresent:self];
}

+ (NSString*)blankDefault:(id)value {
  return [value isKindOfClass:[NSString class]] ? value : @"";
}

- (NSString *)urlStringUsingEncoding:(NSStringEncoding)encoding {
  NSString *charactersToLeaveUnescaped = @"!*'\"();:@&=+$,/?%#[]% ";
  return (NSString *) CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,
                                                                                (CFStringRef) self,
                                                                                (CFStringRef) charactersToLeaveUnescaped,
                                                                                NULL,
                                                                                CFStringConvertNSStringEncodingToEncoding(encoding)));
}

- (NSString *)removeAllWhiteSpaces {
    return [self stringByReplacingOccurrencesOfString:@"\\s" withString:@"" options:NSRegularExpressionSearch range:NSMakeRange(0, [self length])];
}

@end
