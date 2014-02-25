//
//  CoreDataSqliteManager.m
//  CocoaExtensions
//
//  Created by Lars Kuhnt on 05.02.14.
//  Copyright (c) 2014 Promptus. All rights reserved.
//

#import "CoreDataSqliteManager.h"

@implementation CoreDataSqliteManager

+ (id)managerWithStoreName:(NSString*)storeName {
  return [[CoreDataSqliteManager alloc] initWithStoreName:storeName];
}

- (NSPersistentStoreCoordinator *)createPersistentStoreCoordinator:(NSURL *)storeURL {

  NSError *error = nil;
  NSDictionary *currentMetadata = [NSPersistentStoreCoordinator metadataForPersistentStoreOfType:NSSQLiteStoreType
                                                                                           URL:storeURL
                                                                                         error:&error];
  
  if (![self.managedObjectModel isConfiguration:nil compatibleWithStoreMetadata:currentMetadata]) {
    [[NSFileManager defaultManager] removeItemAtURL:storeURL error:&error];
  }

  NSPersistentStoreCoordinator * coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
  if (![coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:self.persistentStoreConfiguration URL:storeURL options:self.persistentStoreOptions error:&error]) {
    /*
     Replace this implementation with code to handle the error appropriately.
     
     abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
     
     Typical reasons for an error here include:
     * The persistent store is not accessible;
     * The schema for the persistent store is incompatible with current managed object model.
     Check the error message to determine what the actual problem was.
     
     
     If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
     
     If you encounter schema incompatibility errors during development, you can reduce their frequency by:
     * Simply deleting the existing store:
     [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
     
     * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
     @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
     
     Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
     
     */
    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    abort();
  }
  return coordinator;
}

@end
