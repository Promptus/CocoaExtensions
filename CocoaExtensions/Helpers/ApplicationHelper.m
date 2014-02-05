//
//  ApplicationHelper.m
//  CocoaExtensions
//
//  Created by Lars Kuhnt on 05.02.14.
//  Copyright (c) 2014 Promptus. All rights reserved.
//

#import "ApplicationHelper.h"

@implementation ApplicationHelper

@synthesize reachability;

- (void)dealloc {
  if (reachability)
    [reachability stopNotifier];
}

# pragma mark Filesystem helpers

+ (NSURL *)documentsDirectory {
  return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

# pragma mark Translation helpers

+ (NSString *)t:(NSString *)key {
  return NSLocalizedString(key, @"");
}

# pragma mark Reachability helpers

- (Reachability*)reachability {
  if (reachability == nil) {
    reachability = [Reachability reachabilityWithHostname:@"www.google.com"];
    [reachability startNotifier];
  }
  return reachability;
}

- (BOOL)isReachable {
  return [self.reachability isReachable];
}

- (BOOL)isUnreachable {
  return ![self.reachability isReachable];
}

- (BOOL)isReachableViaWWAN {
  return [self.reachability isReachableViaWWAN];
}

- (BOOL)isReachableViaWiFi {
  return [self.reachability isReachableViaWiFi];
}

@end
