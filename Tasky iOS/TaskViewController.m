//
//  TaskViewController.m
//  Tasky iOS
//
//  Created by Julian James on 04/07/2013.
//  Copyright (c) 2013 Julian James. All rights reserved.
//

#import "TaskViewController.h"

#import "Task+Helpers.h"

@interface TaskViewController ()

@end

@implementation TaskViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.deleteButton setTitle:MXMLocalizedString(@"DELETE") forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)deleteButtonAction:(id)sender;
{
    [_task deleteTask];
}

- (IBAction)saveButtonAction:(id)sender
{
    [_task setTitle:self.titleTextField.text details:self.detailsTextView.text];
}

- (void) setTask:(Task *)task
{
    _task = task;
    
    self.titleTextField.text = _task.title;
    self.detailsTextView.text = _task.details;
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.titleTextField.text = _task.title;
    self.detailsTextView.text = _task.details;
}

@end
