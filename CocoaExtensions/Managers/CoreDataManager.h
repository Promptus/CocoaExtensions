//
//  CoreDataManager.h
//  CocoaExtensions
//
//  Created by Lars Kuhnt on 05.02.14.
//  Copyright (c) 2014 Promptus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataManager : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSString *persistentStoreName;
@property (readonly, strong, nonatomic) NSString *persistentStoreConfiguration;
@property (readonly, strong, nonatomic) NSDictionary *persistentStoreOptions;

- (id)initWithStoreName:(NSString*)storeName;

- (void)save;
- (NSManagedObjectContext *)createManagedObjectContext;
- (NSPersistentStoreCoordinator*)createPersistentStoreCoordinator:(NSURL*)storeURL;

@end