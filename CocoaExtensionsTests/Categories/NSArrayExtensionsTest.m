//
//  NSArrayExtensionsTest.m
//  CocoaExtensions
//
//  Created by Lars Kuhnt on 31.10.13.
//  Copyright (c) 2013 Promptus. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSArray+Extensions.h"

@interface NSArrayExtensionsTest : XCTestCase {
  NSArray * sample;
}


@end

@implementation NSArrayExtensionsTest

- (void)setUp {
  [super setUp];
  sample = @[[NSNumber numberWithInt:1], [NSNumber numberWithInt:2]];
}

- (void)tearDown {
  [super tearDown];
}

#pragma mark map

- (void)testMap {
  NSArray * result = [sample map:^(NSNumber * item) {
    return [item stringValue];
  }];
  XCTAssertTrue([[result objectAtIndex:0] isEqualToString:@"1"], @"");
  XCTAssertTrue([[result objectAtIndex:1] isEqualToString:@"2"], @"");
}

- (void)testSelect {
  NSArray * result = [sample select:^(NSNumber * item) {
    return (BOOL)([item intValue] == 1);
  }];
  XCTAssertTrue(result.count == (NSUInteger)1, @"");
  XCTAssertTrue([[result objectAtIndex:0] intValue] == 1, @"");
}

@end
