//
//  RootViewController.h
//  Tasky iOS
//
//  Created by Julian James on 03/07/2013.
//  Copyright (c) 2013 Julian James. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TaskCollection;
@class Task;

@interface RootViewController : UITableViewController

@property (strong, nonatomic, readonly) TaskCollection *taskCollection;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addBarButton;

@end
