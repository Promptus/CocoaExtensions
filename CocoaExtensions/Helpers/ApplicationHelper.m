//
//  ApplicationHelper.m
//  CocoaExtensions
//
//  Created by Lars Kuhnt on 05.02.14.
//  Copyright (c) 2014 Promptus. All rights reserved.
//

#import "ApplicationHelper.h"

@implementation ApplicationHelper

+ (NSURL *)documentsDirectory {
  return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

+ (NSString *)t:(NSString *)key {
  return NSLocalizedString(key, @"");
}

@end
