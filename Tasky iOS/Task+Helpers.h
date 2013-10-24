//
//  Task+Helpers.h
//  Tasky iOS
//
//  Created by Julian James on 03/07/2013.
//  Copyright (c) 2013 Julian James. All rights reserved.
//

#import "Task.h"

@interface Task (Helpers)

+ (Task*) createTaskWithTitle:(NSString*) title details:(NSString*)details;
- (void) setTitle:(NSString *)initTitle details:(NSString *)initDetails;
- (void) deleteTask;

@end
