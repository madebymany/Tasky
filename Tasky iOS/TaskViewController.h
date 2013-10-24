//
//  TaskViewController.h
//  Tasky iOS
//
//  Created by Julian James on 04/07/2013.
//  Copyright (c) 2013 Julian James. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseTaskViewController.h"

@class Task;

@interface TaskViewController : BaseTaskViewController

@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@property (strong, nonatomic) Task *task;

- (IBAction)deleteButtonAction:(id)sender;

@end
