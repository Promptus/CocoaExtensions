//
//  NSStringExtensionTest.m
//  CocoaExtensions
//
//  Created by Lars Kuhnt on 04.11.13.
//  Copyright (c) 2013 Promptus. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+Extensions.h"
#import "XCTAssertMacroExtension.h"

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
  NSArray * matches = [@"This is a test string" match:@"test"];
  XCTAssertEqualStrings([matches objectAtIndex:0], @"test");
}

- (void)testScanWithMatchGroups {
  NSArray * matches = [@"This is a test string" match:@"is (.).*st(\\w+)"];
  XCTAssertEqualStrings([matches objectAtIndex:0], @"is is a test string");
  XCTAssertEqualStrings([matches objectAtIndex:1], @"i");
  XCTAssertEqualStrings([matches objectAtIndex:2], @"ring");
}

@end
