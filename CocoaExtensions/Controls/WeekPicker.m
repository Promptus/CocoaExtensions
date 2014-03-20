//
//  WeekPicker.m
//  CocoaExtensions
//
//  Created by Lars Kuhnt on 20.03.14.
//  Copyright (c) 2014 Promptus. All rights reserved.
//

#import "WeekPicker.h"

@implementation WeekPicker

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    [self setupCarousel];
  }
  return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];
  if (self) {
    [self setupCarousel];
  }
  return self;
}

- (void)setupCarousel {
  carousel = [[iCarousel alloc] initWithFrame:self.frame];
  carousel.clipsToBounds = YES;
  carousel.delegate = self;
  carousel.dataSource = self;
  [self addSubview:carousel];
  self.numberOfItems = 80;
  self.numberOfVisibleItems = 7;
}

- (void)load {
  if (self.calendar == nil)
    self.calendar = [NSCalendar currentCalendar];
  if (self.calendarWeekFormatter == nil) {
    self.calendarWeekFormatter = [[NSDateFormatter alloc] init];
    self.calendarWeekFormatter.locale = self.calendar.locale;
    self.calendarWeekFormatter.dateFormat = @"ww";
  }
  if (self.monthAndYearFormatter == nil) {
    self.monthAndYearFormatter = [[NSDateFormatter alloc] init];
    self.monthAndYearFormatter.locale = self.calendar.locale;
    self.monthAndYearFormatter.dateFormat = @"MMM YYYY";
  }
  [self setupWeeks];
}

- (void)setupWeeks {
  weeks = [NSMutableArray arrayWithCapacity:self.numberOfItems];
  int halfNumberOfWeeks = (int)(-7*(self.numberOfItems/2));
  NSNumber * weeksAgo = [NSNumber numberWithInt:halfNumberOfWeeks];
  NSDate * currentWeekDate = [[NSDate date] advance:[weeksAgo days] calendar:self.calendar];
  NSDate * lastWeekDate = currentWeekDate;
  [weeks addObject:[self buildItemDictionary:currentWeekDate lastDate:nil]];
  for (int i = 0; i < self.numberOfItems; i++) {
    currentWeekDate = [currentWeekDate advance:[@7 days] calendar:self.calendar];
    [weeks addObject:[self buildItemDictionary:currentWeekDate lastDate:lastWeekDate]];
    lastWeekDate = currentWeekDate;
  }
  [carousel reloadData];
  [self scrollToCurrentWeek:NO];
}

- (NSDictionary*)buildItemDictionary:(NSDate *)currentDate lastDate:(NSDate *)lastDate {
  NSString * monthLabel = @"";
  if (lastDate == nil || [currentDate month:self.calendar] != [lastDate month:self.calendar]) {
    monthLabel = [[self.monthAndYearFormatter stringFromDate:currentDate] uppercaseString];
  }
  NSString * weekLabel = [NSString stringWithFormat:@"KW %@", [self.calendarWeekFormatter stringFromDate:currentDate]];
  return @{@"date": currentDate, @"monthLabel": monthLabel, @"weekLabel": weekLabel};
}

- (void)scrollToCurrentWeek:(BOOL)animated {
  [carousel scrollToItemAtIndex:self.numberOfItems/2 animated:animated];
}

- (NSDate *)getDate {
  return currentWeekPickerItem.date;
}

- (void)reload {
  if (weeks == nil) {
    
  }
}

#pragma mark iCarouselDelegate


- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view {
  if (view == nil) {
    view = [WeekPickerItem loadFromNib:self];
    view.frame = CGRectMake(0, 0, self.frame.size.width/self.numberOfVisibleItems, self.frame.size.height);
  }
  WeekPickerItem * weekPickerItem = (WeekPickerItem *)view;
  NSDictionary * itemDict = [weeks objectAtIndex:index];
  weekPickerItem.date = [itemDict objectForKey:@"date"];
  weekPickerItem.monthLabel.text = [itemDict objectForKey:@"monthLabel"];
  weekPickerItem.weekLabel.text = [itemDict objectForKey:@"weekLabel"];
  return view;
}

- (void)carouselCurrentItemIndexDidChange:(iCarousel *)_carousel {
  if (currentWeekPickerItem) {
    currentWeekPickerItem.selected = NO;
  }
  currentWeekPickerItem = (WeekPickerItem *)[_carousel itemViewAtIndex:_carousel.currentItemIndex];
  currentWeekPickerItem.selected = YES;
}

- (void)carouselDidEndScrollingAnimation:(iCarousel *)carousel {
  [self sendActionsForControlEvents:UIControlEventValueChanged];
}

#pragma mark iCarouselDataSource

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
  return weeks.count;
}

@end
