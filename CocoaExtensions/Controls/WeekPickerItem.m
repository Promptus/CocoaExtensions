//
//  WeekPickerItem.m
//  KADIS
//
//  Created by Lars Kuhnt on 20.03.14.
//  Copyright (c) 2014 Promptus. All rights reserved.
//

#import "WeekPickerItem.h"

@implementation WeekPickerItem

@synthesize monthLabel;
@synthesize weekLabel;
@synthesize selected;
@synthesize date;

+ (WeekPickerItem*)loadFromNib:(id)owner {
  return [[NSBundle mainBundle] loadNibNamed:@"WeekPickerItem" owner:owner options:nil][0];
}

- (void)setSelected:(BOOL)_selected {
  if (_selected) {
    weekLabel.font = [UIFont boldSystemFontOfSize:14.0f];
  } else {
    weekLabel.font = [UIFont systemFontOfSize:14.0f];
  }
}

@end