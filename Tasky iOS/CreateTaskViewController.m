//
//  CreateTaskViewController.m
//  Tasky iOS
//
//  Created by Julian James on 03/07/2013.
//  Copyright (c) 2013 Julian James. All rights reserved.
//

#import "CreateTaskViewController.h"

#import "Task.h"

@interface CreateTaskViewController ()

@end

@implementation CreateTaskViewController

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
    self.viewLabel.text = MXMLocalizedString(@"CREATE_TASK");
    [self.cancelButton setTitle:MXMLocalizedString(@"CANCEL") forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelButtonAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
