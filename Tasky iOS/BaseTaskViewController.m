//
//  BaseTaskViewController.m
//  Tasky iOS
//
//  Created by Julian James on 04/07/2013.
//  Copyright (c) 2013 Julian James. All rights reserved.
//

#import "BaseTaskViewController.h"

#import "Task+Helpers.h"

@interface BaseTaskViewController ()

@end

@implementation BaseTaskViewController

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
    self.titleLabel.text = MXMLocalizedString(@"TITLE");
    self.detailsLabel.text = MXMLocalizedString(@"DETAILS");
    [self.saveButton setTitle:MXMLocalizedString(@"SAVE") forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setTaskTitle:(NSString*)title details:(NSString*)details
{
    self.titleTextField.text = title;
    self.detailsTextView.text = details;
}

- (IBAction)saveButtonAction:(id)sender
{
    [Task createTaskWithTitle:self.titleTextField.text details:self.detailsTextView.text];
}

- (BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)text
{
    if([text isEqualToString:DONE_KEY])
        [textField becomeFirstResponder];
	return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([text isEqualToString:DONE_KEY])
        [textView resignFirstResponder];
	return YES;
}

@end
