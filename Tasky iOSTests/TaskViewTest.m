//
//  Tasky iOS - TaskViewTest.m
//  Copyright 2013 Julian James. All rights reserved.
//
//  Created by: Julian James
//

// Class under test
#import "TaskViewController.h"

// Collaborators
#import "Task+Helpers.h"

// Test support
#import <SenTestingKit/SenTestingKit.h>

// Uncomment the next two lines to use OCHamcrest for test assertions:
#define HC_SHORTHAND
#import <OCHamcrestIOS/OCHamcrestIOS.h>

// Uncomment the next two lines to use OCMockito for mock objects:
//#define MOCKITO_SHORTHAND
//#import <OCMockitoIOS/OCMockitoIOS.h>


@interface TaskViewTest : SenTestCase
@end

@implementation TaskViewTest
{
    // test fixture ivars go here
    TaskViewController *sut;
    NSInteger notificationCount;
}

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    sut = [STORYBOARD instantiateViewControllerWithIdentifier:@"TaskView"];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(taskModelChanged:) name:TaskModelChanged object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(taskModelDeleted:) name:TaskModelDeleted object:nil];
    [sut view];
    
    notificationCount = 0;
}

- (void)taskModelChanged:(NSNotification*)notification
{
    notificationCount++;
    
    Task *changedTask = notification.object;
    assertThat(changedTask, is(notNilValue()));
    assertThat(changedTask.title, is(notNilValue()));
    assertThat(changedTask.details, is(notNilValue()));
    assertThat([NSNumber numberWithInt:changedTask.title.length], is(greaterThan(@0)));
    assertThat([NSNumber numberWithInt:changedTask.details.length], is(greaterThan(@0)));
}

- (void)taskModelDeleted:(NSNotification*)notification
{
    notificationCount++;
    
    Task *taskToDelete = notification.object;
    
    assertThat(taskToDelete,equalTo(sut.task));
}

- (void)tearDown
{
    // Tear-down code here.
    [[NSNotificationCenter defaultCenter] removeObserver:self name:TaskModelChanged object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:TaskModelDeleted object:nil];
    sut = nil;
    
    [super tearDown];
}

- (void) testTaskViewControllerShouldExist
{
    assertThat(sut, is(notNilValue()));
}

- (void) testTitleLabelShouldBeConnected
{
    assertThat(sut.titleLabel, is(notNilValue()));
}

- (void) testTitleTextFieldShouldBeConnected
{
    assertThat(sut.titleTextField, is(notNilValue()));
}

- (void) testDetailsLabelShouldBeConnected
{
    assertThat(sut.detailsLabel, is(notNilValue()));
}

- (void) testDetailsTextViewShouldBeConnected
{
    assertThat(sut.detailsTextView, is(notNilValue()));
}

- (void) testDeleteButtonShouldBeConnected
{
    assertThat(sut.deleteButton, is(notNilValue()));
}

- (void) testSaveButtonShouldBeConnected
{
    assertThat(sut.saveButton, is(notNilValue()));
}

- (void) testDeleteButtonShouldHaveAction
{
    assertThat([sut.deleteButton actionsForTarget:sut forControlEvent:UIControlEventTouchUpInside], contains(@"deleteButtonAction:",nil));
}

- (void) testSaveButtonShouldHaveAction
{
    assertThat([sut.saveButton actionsForTarget:sut forControlEvent:UIControlEventTouchUpInside], contains(@"saveButtonAction:",nil));
}

- (void) testTitleTextFieldHasDelegate
{
    assertThat(sut.titleTextField.delegate, is(notNilValue()));
}

- (void) testDetailsTextViewHasDelegate
{
    assertThat(sut.detailsTextView.delegate, is(notNilValue()));
}

- (void) testViewHasTask
{
    sut.task = [Task createTaskWithTitle:@"testViewHasTask" details:@"testViewHasTask"];
    
    assertThat(sut.task, is(notNilValue()));
    
    [sut.task deleteTask];
}

- (void) testSaveButtonCreatesTask
{
    sut.task = [Task createTaskWithTitle:@"testSaveButtonCreatesTask" details:@"testSaveButtonCreatesTask"];
    
    [sut saveButtonAction:nil];
    
    assertThat(@(notificationCount), is(@1));
    
    [sut.task deleteTask];
}

- (void) testDeleteButtonReturnsCorrectTask
{
    sut.task = [Task createTaskWithTitle:@"testDeleteButtonReturnsCorrectTask" details:@"testDeleteButtonReturnsCorrectTask"];
    
    [sut deleteButtonAction:nil];

    assertThat(@(notificationCount), is(@1));
    
    [sut.task deleteTask];
}

@end
