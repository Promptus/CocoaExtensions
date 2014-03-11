//
//  NSDecimalNumber+Extensions.h
//  CocoaExtensions
//
//  Created by Lars Kuhnt on 11.03.14.
//  Copyright (c) 2014 Promptus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDecimalNumber (Extensions)

- (NSDecimalNumber*)roundToScale:(NSUInteger)scale;

@end
