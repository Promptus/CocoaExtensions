//
//  NSAttributedString+Extensions.m
//  CocoaExtensions
//
//  Created by Razvan Benga on 17/02/16.
//  Copyright © 2016 Promptus. All rights reserved.
//

#import "NSAttributedString+Extensions.h"

@implementation NSAttributedString (Extensions)

+ (NSAttributedString *)attributedStringFromString:(NSString *)string withFont:(UIFont *)font andColor:(UIColor *)color
{
  NSDictionary *attributesDictionary = @{NSFontAttributeName:font,          NSForegroundColorAttributeName:color};
  return [[NSAttributedString alloc]initWithString:string attributes:attributesDictionary];
}

+ (NSMutableAttributedString *)compoundAttributedString:(NSArray *)attributedStrings
{
  if (attributedStrings == nil || attributedStrings.count == 0) {
    return nil;
  }
  
  NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] init];
  for (NSAttributedString *attString in attributedStrings) {
    [mutableAttributedString appendAttributedString:attString];
  }
  return mutableAttributedString;
}


@end
