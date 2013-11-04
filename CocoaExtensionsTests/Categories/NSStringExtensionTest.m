//
//  NSStringExtensionTest.m
//  CocoaExtensions
//
//  Created by Lars Kuhnt on 04.11.13.
//  Copyright (c) 2013 Promptus. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+Extensions.h"

@interface NSStringExtensionTest : XCTestCase

@end

@implementation NSStringExtensionTest

- (void)setUp {
  [super setUp];
}

- (void)tearDown {
  [super tearDown];
}

#pragma mark scan

- (void)testScanSimpleString {
  NSArray * matches = [@"This is a test string" scan:@"test"];
  XCTAssertTrue([[matches objectAtIndex:0] isEqualToString:@"test"], @"");
}

- (void)testScanForDigits {
  NSArray * matches = [@"This is a 1 liner 4 u" scan:@"\\d"];
  XCTAssertTrue([[matches objectAtIndex:0] isEqualToString:@"1"], @"");
  XCTAssertTrue([[matches objectAtIndex:1] isEqualToString:@"4"], @"");
}

@end
