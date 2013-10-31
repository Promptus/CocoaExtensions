//
//  NSManagedObject+Extensions.m
//  kemmler
//
//  Created by Lars Kuhnt on 28.10.13.
//  Copyright (c) 2013 Coeus Solutions GmbH. All rights reserved.
//

#import "NSManagedObject+Extensions.h"

@implementation NSManagedObject (Extensions)

+ (id)create:(NSManagedObjectContext*)context {
  return [NSEntityDescription insertNewObjectForEntityForName:[self entityName] inManagedObjectContext:context];
}

+ (id)create:(NSDictionary*)dict inContext:(NSManagedObjectContext*)context {
  id instance = [self create:context];
  [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
    [instance setValue:obj forKey:key];
  }];
  return instance;
}

+ (id)find:(NSPredicate *)predicate inContext:(NSManagedObjectContext *)context {
  return [context fetchObjectForEntity:[self entityName] predicate:predicate];
}

+ (NSArray*)all:(NSPredicate *)predicate inContext:(NSManagedObjectContext *)context {
  return [context fetchObjectsForEntity:[self entityName] predicate:predicate];
}

+ (NSUInteger)count:(NSPredicate *)predicate inContext:(NSManagedObjectContext *)context {
  NSFetchRequest *request = [[NSFetchRequest alloc] init];
  NSEntityDescription *entity = [NSEntityDescription entityForName:[self entityName] inManagedObjectContext:context];
  [request setPredicate:predicate];
  [request setEntity:entity];
  NSError *error = nil;
  return [context countForFetchRequest:request error:&error];
}

+ (NSString *)entityName {
  return [NSString stringWithCString:object_getClassName(self) encoding:NSASCIIStringEncoding];
}

@end
