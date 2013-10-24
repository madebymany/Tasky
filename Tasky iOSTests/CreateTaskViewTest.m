//
//  Tasky iOS - CreateTaskViewTest.m
//  Copyright 2013 Julian James. All rights reserved.
//
//  Created by: Julian James
//

// Class under test
#import "CreateTaskViewController.h"

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

@interface CreateTaskViewTest : SenTestCase
@end

@implementation CreateTaskViewTest
{
    // test fixture ivars go here
    CreateTaskViewController *sut;
}

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    sut = [CreateTaskViewController new];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(taskModelAdded:) name:TaskModelAdded object:nil];
    [sut view];
}

- (void)taskModelAdded:(NSNotification*)notification
{
    Task *task = notification.object;
    assertThat(task, is(notNilValue()));
    assertThat(task.title, is(notNilValue()));
    assertThat(task.details, is(notNilValue()));
    assertThat(@(task.title.length), is(greaterThan(@0)));
    assertThat(@(task.details.length), is(greaterThan(@0)));
    
    [task deleteTask];
}

- (void)tearDown
{
    // Tear-down code here.
    [[NSNotificationCenter defaultCenter] removeObserver:self name:TaskModelAdded object:nil];
    sut = nil;
    
    [super tearDown];
}

- (void) testCreateTaskViewControllerShouldExist
{
    assertThat(sut, is(notNilValue()));
}

- (void) testViewLabelShouldBeConnected
{
    assertThat(sut.viewLabel, is(notNilValue()));
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

- (void) testCancelButtonShouldBeConnected
{
    assertThat(sut.cancelButton, is(notNilValue()));
}

- (void) testSaveButtonShouldBeConnected
{
    assertThat(sut.saveButton, is(notNilValue()));
}

- (void) testCancelButtonShouldHaveAction
{
    assertThat([sut.cancelButton actionsForTarget:sut forControlEvent:UIControlEventTouchUpInside], contains(@"cancelButtonAction:",nil));
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

- (void) testSaveButtonCreatesTask
{
    [sut setTaskTitle:@"testSaveButtonCreatesTask" details:@"testSaveButtonCreatesTask"];
    [sut saveButtonAction:nil];
}

@end
