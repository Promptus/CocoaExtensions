//
//  UIColor+Extensions.h
//  CocoaExtensions
//
//  Created by Lars Kuhnt on 06.03.14.
//  Copyright (c) 2014 Promptus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extensions)

+ (UIColor *)colorWithHex:(UInt32)hexadecimal;
+ (UIColor *)colorWithAlphaHex:(UInt32)hexadecimal;

@end
