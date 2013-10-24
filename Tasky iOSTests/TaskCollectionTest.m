//
//  Tasky iOS - TaskCollectionTest.m
//  Copyright 2013 Julian James. All rights reserved.
//
//  Created by: Julian James
//

// Class under test
#import "TaskCollection.h"

// Collaborators
#import "Task.h"

// Test support
#import <SenTestingKit/SenTestingKit.h>

// Uncomment the next two lines to use OCHamcrest for test assertions:
#define HC_SHORTHAND
#import <OCHamcrestIOS/OCHamcrestIOS.h>

// Uncomment the next two lines to use OCMockito for mock objects:
#define MOCKITO_SHORTHAND
#import <OCMockitoIOS/OCMockitoIOS.h>


@interface TaskCollectionTest : SenTestCase
@end

@implementation TaskCollectionTest
{
    // test fixture ivars go here
    TaskCollection *sut;
}

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    sut = [[TaskCollection alloc] initWithEmptyCollection];
}

- (void)tearDown
{
    // Tear-down code here.
    sut = nil;

    [super tearDown];
}

- (Task *)mockAndAddTaskButDeleteAllFirst:(BOOL)deleteAll
{
    if (deleteAll) [sut deleteAllTasks];

    Task *mockTask = mock([Task class]);
    [sut addTaskToCollection:mockTask];
    
    return mockTask;
}

- (void)testTaskCollectionInitialised
{
    assertThat(sut.tasks, is(notNilValue()));
}

- (void)testInitialTaskCollectionCountIsZero
{
    assertThat(@([sut taskCount]), is(@0));
}

- (void)testAddingTaskToAddOneToTaskCount
{
    [self mockAndAddTaskButDeleteAllFirst:YES];
    
    assertThat(@([sut taskCount]), isNot(@0));
}

- (void)testAddingTwoTasksToAddTwoToTaskCount
{
    [self mockAndAddTaskButDeleteAllFirst:YES];
    [self mockAndAddTaskButDeleteAllFirst:NO];
    
    assertThat(@([sut taskCount]), is(@2));
}

- (void)testAddingTaskToAddOneToTaskCountThenDelete
{
    Task *mockTask = [self mockAndAddTaskButDeleteAllFirst:YES];
    
    [sut deleteTask:mockTask];

    assertThat(@([sut taskCount]), is(@0));
}

- (void)testAddingTwoTasksThenRemoveAll
{
    [self mockAndAddTaskButDeleteAllFirst:YES];
    [self mockAndAddTaskButDeleteAllFirst:NO];
    
    [sut deleteAllTasks];
    
    assertThat(@([sut taskCount]), is(@0));
}

- (void)testAddingTaskThenRetrievingSameTask
{
    Task *mockTask = [self mockAndAddTaskButDeleteAllFirst:YES];

    Task *returnedTask = [sut taskAtIndex:0];

    assertThat(mockTask, is(returnedTask));
}

@end
