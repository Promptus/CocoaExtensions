//
//  NSNumber+Extensions.m
//  CocoaExtensions
//
//  Created by Lars Kuhnt on 25.02.14.
//  Copyright (c) 2014 Promptus. All rights reserved.
//

#import "NSNumber+Extensions.h"

@implementation NSNumber (Extensions)

- (NSString *)formattedEuro {
  static NSNumberFormatter *formatter;
  if (formatter == nil) {
    formatter = [[NSNumberFormatter alloc] init];
    formatter.usesGroupingSeparator = YES;
    formatter.groupingSeparator = @".";
    formatter.decimalSeparator = @",";
    formatter.positiveFormat = @"#,##0.00 €";
  }
  return [formatter stringFromNumber:self];
}

- (NSDecimalNumber*)decimalNumberDividedByFloat:(float)divider {
  NSDecimal decimal = [[NSNumber numberWithFloat:[self integerValue]/divider] decimalValue];
  return [NSDecimalNumber decimalNumberWithDecimal:decimal];
}

- (NSInteger)minutes {
  return [self integerValue] * 60;
}

- (NSInteger)hours {
  return [self minutes] * 60;
}

- (NSInteger)days {
  return [self hours] * 24;
}

@end
