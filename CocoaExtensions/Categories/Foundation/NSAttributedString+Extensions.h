//
//  NSAttributedString+Extensions.h
//  CocoaExtensions
//
//  Created by Razvan Benga on 17/02/16.
//  Copyright © 2016 Promptus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (Extensions)

+ (NSAttributedString *)attributedStringFromString:(NSString *)string withFont:(UIFont *)font andColor:(UIColor *)color;

//this returns nil if the attributedString array is nil or empty
+ (NSMutableAttributedString *)compoundAttributedString:(NSArray *)attributedStrings;

@end
