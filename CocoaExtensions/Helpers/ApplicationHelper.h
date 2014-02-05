//
//  ApplicationHelper.h
//  CocoaExtensions
//
//  Created by Lars Kuhnt on 05.02.14.
//  Copyright (c) 2014 Promptus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApplicationHelper : NSObject

+ (NSURL *)documentsDirectory;

+ (NSString*)t:(NSString*)key;

@end
