//
//  CoreDataHelper.h
//  Tasky iOS
//
//  Created by Julian James on 09/07/2013.
//  Copyright (c) 2013 Julian James. All rights reserved.
//

#import <Foundation/Foundation.h>

NSManagedObjectContext *managedObjectContext;
NSManagedObjectContext *testingContext;
NSManagedObjectModel *managedObjectModel;
NSPersistentStoreCoordinator *persistentStoreCoordinator;

@interface CoreDataHelper : NSObject

+ (NSManagedObjectContext *) getManagedObjectContext;
+ (void) saveContext;
+ (void) delete:(id)obj;

@end
