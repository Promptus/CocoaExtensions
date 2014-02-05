//
//  CoreDataSqliteManager.h
//  CocoaExtensions
//
//  Created by Lars Kuhnt on 05.02.14.
//  Copyright (c) 2014 Promptus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreDataManager.h"

@interface CoreDataSqliteManager : CoreDataManager

+ (id)managerWithStoreName:(NSString*)storeName;

@end
