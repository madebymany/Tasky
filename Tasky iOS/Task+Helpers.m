//
//  Task+Helpers.m
//  Tasky iOS
//
//  Created by Julian James on 03/07/2013.
//  Copyright (c) 2013 Julian James. All rights reserved.
//

#import "Task+Helpers.h"
#import "CoreDataHelper.h"

@implementation Task (Helpers)

+(Task*) createTaskWithTitle:(NSString*) title details:(NSString*)details
{
    NSManagedObjectContext *context = [CoreDataHelper getManagedObjectContext];
    
    Task *task = [NSEntityDescription insertNewObjectForEntityForName:@"Task" inManagedObjectContext:context];
    
    task.title = title;
    task.details = details;
    
    [CoreDataHelper saveContext];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:TaskModelAdded object:task];
    
    return task;
}

- (void) setTitle:(NSString *)initTitle details:(NSString *)initDetails
{
    self.title = initTitle;
    self.details = initDetails;
    
    [CoreDataHelper saveContext];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:TaskModelChanged object:self];
}

- (void) deleteTask
{
    [CoreDataHelper delete:self];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:TaskModelDeleted object:self];
}

@end
