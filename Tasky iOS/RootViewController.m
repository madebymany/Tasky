//
//  RootViewController.m
//  Tasky iOS
//
//  Created by Julian James on 03/07/2013.
//  Copyright (c) 2013 Julian James. All rights reserved.
//

#import "RootViewController.h"

#import "CreateTaskViewController.h"
#import "TaskCollection.h"
#import "TaskViewController.h"
#import "Task+Helpers.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(taskModelAdded:) name:TaskModelAdded object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(taskModelChanged:) name:TaskModelChanged object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(taskModelDeleted:) name:TaskModelDeleted object:nil];
    _taskCollection = [TaskCollection new];
    self.navigationItem.title = MXMLocalizedString(@"TASKS");

}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (void)taskModelAdded:(NSNotification*)notification
{
    Task *task = notification.object;
    [_taskCollection addTaskToCollection:task];
    [self.tableView reloadData];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)taskModelChanged:(NSNotification*)notification
{    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)taskModelDeleted:(NSNotification*)notification
{
    Task *task = notification.object;
    [_taskCollection deleteTask:task];
    [self.tableView reloadData];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:TaskModelChanged object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) createTaskButtonAction:(id)sender
{
    [self presentViewController:[[CreateTaskViewController alloc] init] animated:YES completion:nil];
}

#pragma
#pragma UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_taskCollection taskCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TASK" forIndexPath:indexPath];
    // configure cell here
    Task *task = [_taskCollection taskAtIndex:indexPath.row];
    cell.textLabel.text = task.title;
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    TaskViewController *tvc = [segue destinationViewController];
    tvc.task = [_taskCollection taskAtIndex:[self.tableView indexPathForCell:(UITableViewCell*)sender].row];
}

@end
