//
//  NSNumber+Extensions.h
//  CocoaExtensions
//
//  Created by Lars Kuhnt on 25.02.14.
//  Copyright (c) 2014 Promptus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (Extensions)

- (NSString *)formattedEuro;
- (NSString *)formattedRoundedEuroWithoutDecimals;
- (NSDecimalNumber*)decimalNumberDividedByFloat:(float)divider;
- (NSInteger)minutes;
- (NSInteger)hours;
- (NSInteger)days;
- (NSString*)formattedString:(NSLocale*)locale;

@end
