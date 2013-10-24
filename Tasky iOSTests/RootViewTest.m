//
//  Tasky iOS - RootViewTest.m
//  Copyright 2013 Julian James. All rights reserved.
//
//  Created by: Julian James
//

// Class under test
#import "RootViewController.h"

// Collaborators

// Test support
//#import <XCTest/XCTest.h>
#import <SenTestingKit/SenTestingKit.h>

// Uncomment the next two lines to use OCHamcrest for test assertions:
#define HC_SHORTHAND
#import <OCHamcrestIOS/OCHamcrestIOS.h>

// Uncomment the next two lines to use OCMockito for mock objects:
//#define MOCKITO_SHORTHAND
//#import <OCMockitoIOS/OCMockitoIOS.h>


@interface RootViewTest : SenTestCase
@end

@implementation RootViewTest
{
    // test fixture ivars go here
    RootViewController *sut;

}

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    sut = [STORYBOARD instantiateViewControllerWithIdentifier:@"RootView"];
    [sut view];
}

- (void)tearDown
{
    // Tear-down code here.
    sut = nil;
    
    [super tearDown];
}

- (void) testRootViewControllerShouldExist
{
    assertThat(sut, is(notNilValue()));
}

- (void) testAddButtonShouldBeConnected
{
    assertThat(sut.addBarButton, is(notNilValue()));
}

- (void) testAddButtonActionNotNil
{
    assertThat(NSStringFromSelector(sut.addBarButton.action), is(notNilValue()));
}

- (void) testAddButtonShouldHaveAction
{
    assertThat(NSStringFromSelector(sut.addBarButton.action), is(@"createTaskButtonAction:"));
}

- (void) testRootViewControllerTaskCollectionExists
{
    assertThat(sut.taskCollection, is(notNilValue()));
}



@end
