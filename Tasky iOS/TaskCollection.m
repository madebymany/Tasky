//
//  TaskCollection.m
//  Tasky iOS
//
//  Created by Julian James on 04/07/2013.
//  Copyright (c) 2013 Julian James. All rights reserved.
//

#import "TaskCollection.h"
#import "CoreDataHelper.h"
#import <CoreData/CoreData.h>

@implementation TaskCollection

- (id) init
{
    self = [super init];
    if (self)
        [self getPersistedTasks];
    return self;
}

- (id) initWithEmptyCollection
{
    self = [super init];
    if (self)
        _tasks = [NSMutableArray new];
    return self;
}

- (NSUInteger) taskCount
{
    return _tasks.count;
}

- (void) addTaskToCollection:(Task*)task
{
    [_tasks addObject:task];
}

- (void) deleteTask:(Task*)task
{
    [_tasks removeObject:task];
}

- (void) deleteAllTasks
{
    [_tasks removeAllObjects];
}

- (Task*) taskAtIndex:(NSUInteger)index
{
    return [_tasks objectAtIndex:index];
}

- (void) getPersistedTasks
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Task" inManagedObjectContext:[CoreDataHelper getManagedObjectContext]];
    [request setEntity:entity];
    
    NSError *error = nil;
    NSMutableArray *mutableFetchResults = [[[CoreDataHelper getManagedObjectContext] executeFetchRequest:request error:&error] mutableCopy];
    if (mutableFetchResults == nil) {
        _tasks = [NSMutableArray new];
    } else {
        if ([mutableFetchResults count] > 0) {
            _tasks = mutableFetchResults;
        }
    }
}

@end
