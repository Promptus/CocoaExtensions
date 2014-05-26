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

- (NSDate *)beginningOfDay:(NSCalendar*)calendar {
  NSDate *beginningOfDay;
  NSTimeInterval interval;
  [calendar rangeOfUnit:NSDayCalendarUnit startDate:&beginningOfDay interval:&interval forDate:self];
  return beginningOfDay;
}

- (NSDate *)endOfDay:(NSCalendar*)calendar {
  NSDate *beginningOfDay;
  NSTimeInterval interval;
  [calendar rangeOfUnit:NSDayCalendarUnit startDate:&beginningOfDay interval:&interval forDate:self];
  return [beginningOfDay dateByAddingTimeInterval:interval-1];
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

- (BOOL)isToday:(NSCalendar *)calendar {
  int mask = NSCalendarUnitEra|NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay;
  NSDateComponents *components = [calendar components:(mask) fromDate:[NSDate date]];
  NSDate *today = [calendar dateFromComponents:components];
  components = [calendar components:(mask) fromDate:self];
  NSDate *otherDate = [calendar dateFromComponents:components];
  return [today isEqualToDate:otherDate];
}

-(BOOL)isTomorrow:(NSCalendar *)calendar {
  int mask = NSCalendarUnitEra|NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay;
  NSDateComponents *components = [calendar components:(mask) fromDate:[NSDate date]];
  NSDate *tomorrow = [[calendar dateFromComponents:components] advance:[@1 days] calendar:calendar];
  components = [calendar components:(mask) fromDate:self];
  NSDate *otherDate = [calendar dateFromComponents:components];
  return [tomorrow isEqualToDate:otherDate];
}

- (BOOL)isLaterThan:(NSDate *)date {
  return [self compare:date] == NSOrderedDescending;
}

- (BOOL)isEarlierThan:(NSDate *)date {
  return [self compare:date] == NSOrderedAscending;
}

- (NSString *)formattedString:(NSString *)format {
  static NSDateFormatter * formatter;
  if (formatter == nil) {
    formatter = [[NSDateFormatter alloc] init];
  }
  formatter.dateFormat = format;
  return [formatter stringFromDate:self];
}

@end
