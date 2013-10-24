//
//  BaseTaskViewController.h
//  Tasky iOS
//
//  Created by Julian James on 04/07/2013.
//  Copyright (c) 2013 Julian James. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTaskViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailsLabel;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *detailsTextView;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

- (IBAction)saveButtonAction:(id)sender;
- (void)setTaskTitle:(NSString*)title details:(NSString*)details;

@end
