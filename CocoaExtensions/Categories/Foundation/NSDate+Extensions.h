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
- (NSUInteger)calendarWeek:(NSCalendar *)calendar;
- (NSUInteger)month:(NSCalendar *)calendar;
- (NSUInteger)year:(NSCalendar *)calendar;

@end
