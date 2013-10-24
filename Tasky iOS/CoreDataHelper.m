//
//  CoreDataHelper.m
//  Tasky iOS
//
//  Created by Julian James on 09/07/2013.
//  Copyright (c) 2013 Julian James. All rights reserved.
//

#import "CoreDataHelper.h"

#import "AppDelegate.h"

#import <CoreData/CoreData.h>


@implementation CoreDataHelper

+ (NSManagedObjectContext *) getManagedObjectContext {
    if (APP_DELEGATE == nil) {
        return testingContext;
    }
    return [self managedObjectContext];
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
+ (NSManagedObjectContext *)managedObjectContext
{
    if (managedObjectContext != nil) {
        return managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        managedObjectContext = [[NSManagedObjectContext alloc] init];
        [managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
+ (NSManagedObjectModel *)managedObjectModel
{
    if (managedObjectModel != nil) {
        return managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Tasky" withExtension:@"momd"];
    managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return managedObjectModel;
}

// Returns the URL to the application's Documents directory.
+ (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

+ (void) deletePersistentStore
{
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Tasky.sqlite"];
    NSError *error = nil;
    [[NSFileManager defaultManager] removeItemAtURL:storeURL error:&error];
    if (error != nil)
        NSLog(@"removeItemAtURL error %@, %@", error, [error userInfo]);
    persistentStoreCoordinator = nil;
    managedObjectContext = nil;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
+ (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (persistentStoreCoordinator != nil) {
        return persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Tasky.sqlite"];
    
    NSDictionary *options = @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES};
    
    NSError *error = nil;
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error]) {
        [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil];
    }
    
    return persistentStoreCoordinator;
}

+ (void) saveContext
{
    NSError *error = nil;
    if (managedObjectContext != nil) {
        if (![managedObjectContext save:&error] && [managedObjectContext hasChanges]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            // NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            // abort();
        }
    }
}

+ (void) delete:(id)obj
{
    [managedObjectContext deleteObject:obj];
    [self saveContext];
}

@end