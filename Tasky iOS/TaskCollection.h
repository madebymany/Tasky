//
//  TaskCollection.h
//  Tasky iOS
//
//  Created by Julian James on 04/07/2013.
//  Copyright (c) 2013 Julian James. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Task;

@interface TaskCollection : NSObject

@property (strong, nonatomic, readonly) NSMutableArray *tasks;

- (id) initWithEmptyCollection;
- (NSUInteger) taskCount;
- (void) addTaskToCollection:(Task*)task;
- (void) deleteTask:(Task*)task;
- (void) deleteAllTasks;
- (Task*) taskAtIndex:(NSUInteger)index;

@end
