//
//  NSDate+Extensions.m
//  CocoaExtensions
//
//  Created by Lars Kuhnt on 28.02.14.
//  Copyright (c) 2014 Promptus. All rights reserved.
//

#import "NSDate+Extensions.h"

@implementation NSDate (Extensions)

- (NSDate *)advance:(NSInteger)seconds calendar:(NSCalendar *)calendar {
  NSDateComponents *dayComponent = [[NSDateComponents alloc] init];
  dayComponent.second = seconds;
  return [calendar dateByAddingComponents:dayComponent toDate:self options:0];
}

- (NSDate *)tomorrow:(NSCalendar*)calendar {
  return [self advance:[@1 days] calendar:calendar];
}

- (NSDate *)yesterday:(NSCalendar*)calendar {
  return [self advance:[@-1 days] calendar:calendar];
}

- (NSDate *)beginningOfWeek:(NSCalendar*)calendar {
  NSDate *beginningOfWeek;
  NSTimeInterval interval;
  [calendar rangeOfUnit:NSWeekCalendarUnit startDate:&beginningOfWeek interval:&interval forDate:self];
  return beginningOfWeek;
}

- (NSDate *)endOfWeek:(NSCalendar*)calendar {
  NSDate *beginningOfWeek;
  NSTimeInterval interval;
  [calendar rangeOfUnit:NSWeekCalendarUnit startDate:&beginningOfWeek interval:&interval forDate:self];
  return [beginningOfWeek dateByAddingTimeInterval:interval-1];
}

- (NSUInteger)calendarWeek:(NSCalendar *)calendar {
  NSDateComponents *comps = [calendar components:NSWeekdayCalendarUnit fromDate:self];
  return [comps weekday];
}

- (NSUInteger)month:(NSCalendar *)calendar {
  NSDateComponents *comps = [calendar components:NSMonthCalendarUnit fromDate:self];
  return [comps month];
}

- (NSUInteger)year:(NSCalendar *)calendar {
  NSDateComponents *comps = [calendar components:NSYearCalendarUnit fromDate:self];
  return [comps year];
}

@end
