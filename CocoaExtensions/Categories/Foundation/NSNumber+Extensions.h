//
//  NSNumber+Extensions.h
//  CocoaExtensions
//
//  Created by Lars Kuhnt on 25.02.14.
//  Copyright (c) 2014 Promptus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (Extensions)

- (NSString *)ce_formattedEuro;
- (NSString *)ce_formattedRoundedEuroWithoutDecimals;
- (NSDecimalNumber*)ce_decimalNumberDividedByFloat:(float)divider;
- (NSInteger)ce_minutes;
- (NSInteger)ce_hours;
- (NSInteger)ce_days;
- (NSString*)ce_formattedString:(NSLocale*)locale;

@end
