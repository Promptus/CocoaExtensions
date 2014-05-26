//
//  NSDate+Extensions.h
//  CocoaExtensions
//
//  Created by Lars Kuhnt on 28.02.14.
//  Copyright (c) 2014 Promptus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSNumber+Extensions.h"

@interface NSDate (Extensions)

- (NSDate *)advance:(NSInteger)seconds calendar:(NSCalendar*)calendar;
- (NSDate *)yesterday:(NSCalendar*)calendar;
- (NSDate *)tomorrow:(NSCalendar*)calendar;
- (NSDate *)beginningOfWeek:(NSCalendar*)calendar;
- (NSDate *)endOfWeek:(NSCalendar*)calendar;
- (NSDate *)beginningOfDay:(NSCalendar*)calendar;
- (NSDate *)endOfDay:(NSCalendar*)calendar;
- (NSUInteger)calendarWeek:(NSCalendar *)calendar;
- (NSUInteger)month:(NSCalendar *)calendar;
- (NSUInteger)year:(NSCalendar *)calendar;
- (BOOL)isToday:(NSCalendar *)calendar;
- (BOOL)isTomorrow:(NSCalendar *)calendar;
- (BOOL)isLaterThan:(NSDate*)date;
- (BOOL)isEarlierThan:(NSDate *)date;

- (NSString*)formattedString:(NSString*)format;

@end
