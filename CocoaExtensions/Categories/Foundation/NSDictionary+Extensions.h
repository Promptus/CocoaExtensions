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

- (NSString*)stringForKey:(NSString*)key;
- (NSNumber*)numberForKey:(NSString*)key;
- (NSDecimalNumber*)decimalNumberForKey:(NSString*)key;
- (NSDate *)dateForKey:(NSString *)key withFormatter:(NSDateFormatter *)dateFormatter;

@end
