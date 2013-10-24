//
//  Tasky iOS - CoreDataTest.m
//  Copyright 2013 Julian James. All rights reserved.
//
//  Created by: Julian James
//

// Class under test
#import "TaskCollection.h"

// Collaborators
#import <CoreData/CoreData.h>
#import "CoreDataHelper.h"
#import "Task+Helpers.h"

// Test support
#import <SenTestingKit/SenTestingKit.h>

// Uncomment the next two lines to use OCHamcrest for test assertions:
#define HC_SHORTHAND
#import <OCHamcrestIOS/OCHamcrestIOS.h>

// Uncomment the next two lines to use OCMockito for mock objects:
//#define MOCKITO_SHORTHAND
//#import <OCMockitoIOS/OCMockitoIOS.h>

@interface CoreDataTest : SenTestCase
@end

@implementation CoreDataTest
{
    // test fixture ivars go here
    NSManagedObjectModel *model;
    NSPersistentStoreCoordinator *coord;
    NSPersistentStore *store;
}

- (NSMutableArray *) getPersistedTasks
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Task" inManagedObjectContext:[CoreDataHelper getManagedObjectContext]];
    [request setEntity:entity];
    
    NSMutableArray *tasks;
    NSError *error = nil;
    NSMutableArray *mutableFetchResults = [[[CoreDataHelper getManagedObjectContext] executeFetchRequest:request error:&error] mutableCopy];
    if (mutableFetchResults == nil) {
        tasks = nil;
    } else {
        if ([mutableFetchResults count] > 0) {
            tasks = mutableFetchResults;
        }
    }
    return tasks;
}

- (void)setUp
{
    [super setUp];
    
    NSBundle *bundle = [NSBundle bundleForClass:self.class];
    NSURL *modURL = [bundle URLForResource:@"Tasky" withExtension:@"momd"];
    model = [[NSManagedObjectModel alloc] initWithContentsOfURL:modURL];
    coord = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: model];
    store = [coord addPersistentStoreWithType:NSInMemoryStoreType configuration:nil URL:nil options:nil error:nil];
    testingContext = [[NSManagedObjectContext alloc] init];
    [testingContext setPersistentStoreCoordinator: coord];
}

- (void)tearDown
{
    // release context and model
    NSError *error;
    
    if (![coord removePersistentStore:store error:&error])
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    
    model = nil;
    testingContext = nil;
    coord = nil;
    
    [super tearDown];
}

- (void)testNSManagedObjectModelNotNil
{
    assertThat(model, is(notNilValue()));
}

- (void)testNSPersistentStoreCoordinatorNotNil
{
    assertThat(coord, is(notNilValue()));
}

- (void)testNSPersistentStoreNotNil
{
    assertThat(store, is(notNilValue()));
}

- (void)testCreatingPersistentTask
{
    Task *task = [Task createTaskWithTitle:@"testCreatingPersistentTask" details:@"testCreatingPersistentTask"];
    
    NSMutableArray *tasks = [self getPersistedTasks];
    
    assertThat(@([tasks containsObject:task]), is(@(YES)));
    
    [task deleteTask];
}

- (void)testDeletingPersistentTask
{
    Task *task = [Task createTaskWithTitle:@"testDeletingPersistentTask" details:@"testDeletingPersistentTask"];
    
    [task deleteTask];

    NSMutableArray *tasks = [self getPersistedTasks];
    
    assertThat(@([tasks containsObject:task]), is(@(NO)));
}

@end
