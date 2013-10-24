//
//  CreateTaskViewController.h
//  Tasky iOS
//
//  Created by Julian James on 03/07/2013.
//  Copyright (c) 2013 Julian James. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseTaskViewController.h"

@class Task;

@interface CreateTaskViewController : BaseTaskViewController

@property (weak, nonatomic) IBOutlet UILabel *viewLabel;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@end
