//
//  NSDictionary+Extensions.h
//  CocoaExtensions
//
//  Created by Lars Kuhnt on 16.05.14.
//  Copyright (c) 2014 Promptus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+Extensions.h"

@interface NSDictionary (Extensions)

- (NSString*)ce_stringForKey:(NSString*)key;
- (NSNumber*)ce_numberForKey:(NSString*)key;
- (NSDecimalNumber*)ce_decimalNumberForKey:(NSString*)key;
- (NSDate *)ce_dateForKey:(NSString *)key withFormatter:(NSDateFormatter *)dateFormatter;

@end
